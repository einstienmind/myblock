/* -*- c++ -*- */

%include "gnuradio.i"			// the common stuff

%{
#include "gr_ofdm_mapper_bcv.h"
//#include "howto_square2_ff.h"
%}

// ----------------------------------------------------------------

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 *
 * This does some behind-the-scenes magic so we can
 * access howto_square_ff from python as howto.square_ff
 */
GR_SWIG_BLOCK_MAGIC(gr,ofdm_mapper_bcv);

gr_ofdm_mapper_bcv_sptr 
gr_make_ofdm_mapper_bcv (const std::vector<gr_complex> &constellation,
			 unsigned int msgq_limit,
			 unsigned int bits_per_symbol, 
			 unsigned int fft_length);


class gr_ofdm_mapper_bcv : public gr_sync_block
{
 protected:
  gr_ofdm_mapper_bcv (const std::vector<gr_complex> &constellation,
		      unsigned int msgq_limit,
		      unsigned int bits_per_symbol,
		      unsigned int fft_length);
  
 public:
  gr_msg_queue_sptr msgq();
  int set_new_carriermap(std::string carrier_map);
  int work(int noutput_items,
	   gr_vector_const_void_star &input_items,
	   gr_vector_void_star &output_items);
};
