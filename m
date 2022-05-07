Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCC351E3CF
	for <lists+linux-i2c@lfdr.de>; Sat,  7 May 2022 05:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392249AbiEGDge (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 23:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiEGDgd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 23:36:33 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE4F69494;
        Fri,  6 May 2022 20:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651894368; x=1683430368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yUWM/E07ObxFrPxqWHC8qXKS7ssjAX/Ep6WMvbDeYAI=;
  b=djWGXNILOp6XhbbgsBzf+ubxwCn+SuDJdOvkBTzHUd01pgLL4rL2R2u7
   2fjS9jeMzgLUT9gKWed1WDwSLckNI+BYUfXBWL2MeFHKgnQSHIOjELJCD
   zy50fPCzVuDr/4iQYo3TSH8p+xb7g8W67Y1x5HIFkKvQYV2UHwTG7LulK
   xbr/8yQmxXgO19iyc1z+sQynpzdpBsVDBUE1/D+lQmUeVaGwdy6SmzInk
   ypn0I4P1kQuLXWiKre42/bSClx5GxlDKbqBDz6iXKKJ/NY1/dFXgg/+ea
   Pl9B4JWRPH3Jm4jFeOcWKk2Lc89IPvDLfoFPUleSu4OyOWqVPn4n+lDsB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="266234304"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="266234304"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 20:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="633226287"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 May 2022 20:32:45 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nnBBU-000EBY-MQ;
        Sat, 07 May 2022 03:32:44 +0000
Date:   Sat, 7 May 2022 11:31:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yihao Han <hanyihao@vivo.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel@vivo.com,
        Yihao Han <hanyihao@vivo.com>
Subject: Re: [PATCH v2] i2c: s3c2410: change return type of
 'i2c_s3c_irq_nextbyte' from 'int' to 'void'
Message-ID: <202205071109.36SjNuHG-lkp@intel.com>
References: <20220506122639.2544-1-hanyihao@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506122639.2544-1-hanyihao@vivo.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yihao,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on v5.18-rc5 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yihao-Han/i2c-s3c2410-change-return-type-of-i2c_s3c_irq_nextbyte-from-int-to-void/20220506-202923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
config: arm-randconfig-c002-20220506 (https://download.01.org/0day-ci/archive/20220507/202205071109.36SjNuHG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/fdefdf435e27cd445a10a77f475e6d316245ed2b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yihao-Han/i2c-s3c2410-change-return-type-of-i2c_s3c_irq_nextbyte-from-int-to-void/20220506-202923
        git checkout fdefdf435e27cd445a10a77f475e6d316245ed2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-s3c2410.c:384:13: error: conflicting types for 'i2c_s3c_irq_nextbyte'
   static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
               ^
   drivers/i2c/busses/i2c-s3c2410.c:140:12: note: previous declaration is here
   static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat);
              ^
   1 error generated.


vim +/i2c_s3c_irq_nextbyte +384 drivers/i2c/busses/i2c-s3c2410.c

   380	
   381	/*
   382	 * process an interrupt and work out what to do
   383	 */
 > 384	static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
   385	{
   386		unsigned long tmp;
   387		unsigned char byte;
   388	
   389		switch (i2c->state) {
   390	
   391		case STATE_IDLE:
   392			dev_err(i2c->dev, "%s: called in STATE_IDLE\n", __func__);
   393			return;
   394	
   395		case STATE_STOP:
   396			dev_err(i2c->dev, "%s: called in STATE_STOP\n", __func__);
   397			s3c24xx_i2c_disable_irq(i2c);
   398			goto out_ack;
   399	
   400		case STATE_START:
   401			/*
   402			 * last thing we did was send a start condition on the
   403			 * bus, or started a new i2c message
   404			 */
   405			if (iicstat & S3C2410_IICSTAT_LASTBIT &&
   406			    !(i2c->msg->flags & I2C_M_IGNORE_NAK)) {
   407				/* ack was not received... */
   408				dev_dbg(i2c->dev, "ack was not received\n");
   409				s3c24xx_i2c_stop(i2c, -ENXIO);
   410				goto out_ack;
   411			}
   412	
   413			if (i2c->msg->flags & I2C_M_RD)
   414				i2c->state = STATE_READ;
   415			else
   416				i2c->state = STATE_WRITE;
   417	
   418			/*
   419			 * Terminate the transfer if there is nothing to do
   420			 * as this is used by the i2c probe to find devices.
   421			 */
   422			if (is_lastmsg(i2c) && i2c->msg->len == 0) {
   423				s3c24xx_i2c_stop(i2c, 0);
   424				goto out_ack;
   425			}
   426	
   427			if (i2c->state == STATE_READ)
   428				goto prepare_read;
   429	
   430			/*
   431			 * fall through to the write state, as we will need to
   432			 * send a byte as well
   433			 */
   434			fallthrough;
   435		case STATE_WRITE:
   436			/*
   437			 * we are writing data to the device... check for the
   438			 * end of the message, and if so, work out what to do
   439			 */
   440			if (!(i2c->msg->flags & I2C_M_IGNORE_NAK)) {
   441				if (iicstat & S3C2410_IICSTAT_LASTBIT) {
   442					dev_dbg(i2c->dev, "WRITE: No Ack\n");
   443	
   444					s3c24xx_i2c_stop(i2c, -ECONNREFUSED);
   445					goto out_ack;
   446				}
   447			}
   448	
   449	 retry_write:
   450	
   451			if (!is_msgend(i2c)) {
   452				byte = i2c->msg->buf[i2c->msg_ptr++];
   453				writeb(byte, i2c->regs + S3C2410_IICDS);
   454	
   455				/*
   456				 * delay after writing the byte to allow the
   457				 * data setup time on the bus, as writing the
   458				 * data to the register causes the first bit
   459				 * to appear on SDA, and SCL will change as
   460				 * soon as the interrupt is acknowledged
   461				 */
   462				ndelay(i2c->tx_setup);
   463	
   464			} else if (!is_lastmsg(i2c)) {
   465				/* we need to go to the next i2c message */
   466	
   467				dev_dbg(i2c->dev, "WRITE: Next Message\n");
   468	
   469				i2c->msg_ptr = 0;
   470				i2c->msg_idx++;
   471				i2c->msg++;
   472	
   473				/* check to see if we need to do another message */
   474				if (i2c->msg->flags & I2C_M_NOSTART) {
   475	
   476					if (i2c->msg->flags & I2C_M_RD) {
   477						/*
   478						 * cannot do this, the controller
   479						 * forces us to send a new START
   480						 * when we change direction
   481						 */
   482						dev_dbg(i2c->dev,
   483							"missing START before write->read\n");
   484						s3c24xx_i2c_stop(i2c, -EINVAL);
   485						break;
   486					}
   487	
   488					goto retry_write;
   489				} else {
   490					/* send the new start */
   491					s3c24xx_i2c_message_start(i2c, i2c->msg);
   492					i2c->state = STATE_START;
   493				}
   494	
   495			} else {
   496				/* send stop */
   497				s3c24xx_i2c_stop(i2c, 0);
   498			}
   499			break;
   500	
   501		case STATE_READ:
   502			/*
   503			 * we have a byte of data in the data register, do
   504			 * something with it, and then work out whether we are
   505			 * going to do any more read/write
   506			 */
   507			byte = readb(i2c->regs + S3C2410_IICDS);
   508			i2c->msg->buf[i2c->msg_ptr++] = byte;
   509	
   510			/* Add actual length to read for smbus block read */
   511			if (i2c->msg->flags & I2C_M_RECV_LEN && i2c->msg->len == 1)
   512				i2c->msg->len += byte;
   513	 prepare_read:
   514			if (is_msglast(i2c)) {
   515				/* last byte of buffer */
   516	
   517				if (is_lastmsg(i2c))
   518					s3c24xx_i2c_disable_ack(i2c);
   519	
   520			} else if (is_msgend(i2c)) {
   521				/*
   522				 * ok, we've read the entire buffer, see if there
   523				 * is anything else we need to do
   524				 */
   525				if (is_lastmsg(i2c)) {
   526					/* last message, send stop and complete */
   527					dev_dbg(i2c->dev, "READ: Send Stop\n");
   528	
   529					s3c24xx_i2c_stop(i2c, 0);
   530				} else {
   531					/* go to the next transfer */
   532					dev_dbg(i2c->dev, "READ: Next Transfer\n");
   533	
   534					i2c->msg_ptr = 0;
   535					i2c->msg_idx++;
   536					i2c->msg++;
   537				}
   538			}
   539	
   540			break;
   541		}
   542	
   543		/* acknowlegde the IRQ and get back on with the work */
   544	
   545	 out_ack:
   546		tmp = readl(i2c->regs + S3C2410_IICCON);
   547		tmp &= ~S3C2410_IICCON_IRQPEND;
   548		writel(tmp, i2c->regs + S3C2410_IICCON);
   549	}
   550	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
