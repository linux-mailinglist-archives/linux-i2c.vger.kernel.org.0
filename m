Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 945197BA154
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Oct 2023 16:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236270AbjJEOnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 10:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237132AbjJEOik (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 10:38:40 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EBB4785E;
        Thu,  5 Oct 2023 07:02:55 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3955F1Eb014545;
        Thu, 5 Oct 2023 09:19:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=UELHM3+btlr1tLsVkeUaq
        pciYdarLBdmCA0OkNzAXRs=; b=jUlsFwuSfJMzmlsawbWienb/4c0cCH3wUY4C7
        sZwnGNaJLzGc+3HlE1GJFHKr1wFHxIRttM4DeJQbZM0Yk+sDFk377PUdSGMdzVZ6
        PVN3Lzw7bRgilrcVH1WQ62KiEIJGGmkjJ7kKQpHduHX0NDw+X2ncUv0y9uxcQODB
        MfVkVf9QSoicH7epvhwTJCV5j8K7i+gTDP6eHJvZV7pvRL2xaJyE1aHW7bUYJrf8
        QH2JAx7svAxmaoNSD6S4zzCMCrJc50hioroFRa6P1jL5jpo7cWtXnNnFugoFwnig
        qdPOcv69K0TUBejk7Kyio3+lt5jQeBo71HH5f05umnp+YArAA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thpu0rfdv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Oct 2023 09:19:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4202E10005D;
        Thu,  5 Oct 2023 09:19:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39FEA21C2FC;
        Thu,  5 Oct 2023 09:19:38 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 09:19:37 +0200
Date:   Thu, 5 Oct 2023 09:19:22 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: stm32f7: Fix PEC handling in case of SMBUS transfers
Message-ID: <20231005071922.GA1372701@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andi Shyti <andi.shyti@kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231002084211.1108940-1-alain.volmat@foss.st.com>
 <20231003174246.vdazyls3c7kykd63@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003174246.vdazyls3c7kykd63@zenone.zhora.eu>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_04,2023-10-02_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thanks for the review.

On Tue, Oct 03, 2023 at 07:42:46PM +0200, Andi Shyti wrote:
> Hi Alain,
> 
> On Mon, Oct 02, 2023 at 10:42:10AM +0200, Alain Volmat wrote:
> > The PECBYTE bit allows to generate (in case of write) or
> > compute/compare the PEC byte (in case of read).  In case
> > of reading a value (performed by first sending a write
> > command, then followed by a read command) the PECBYTE should
> > only be set before starting the read command and not before
> > the first write command.
> 
> What is this patch fixing?
> 
> Can you please point this detail in the documentation, I haven't
> found it[*]

This is about the handling of the PECBYTE bit of the I2C_CR2 register
(cf page 1010 of the spec you pointed).  There were no issue in case
of performing SMBUS write (with PEC), however read was not working.
PECBYTE was set from the very beginning of the transaction, but since
SMBUS read is first made of a write transfer, followed by a read transfer,
the PECBYTE was appended to the end of the write transfer (instead of the read
transfer), leading to lose of the last byte of the write transfer.
(in addition to the fact that the PEC byte should NOT be placed at the
end of the write transfer).
(cf Figure 30 of SMBUS specification [1]).

I could add more information within the commit log if you prefer.

[1] http://www.smbus.org/specs/SMBus_3_2_20220112.pdf

> 
> > Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols support")
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> please, don't leave blank lines between tags.

Ok,  will remove this blank line within a v2.

Thanks,
Alain

> 
> Thanks,
> Andi
> 
> [*] Hope this is the correct one:
> https://www.st.com/resource/en/reference_manual/rm0385-stm32f75xxx-and-stm32f74xxx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf
> 
> > ---
> >  drivers/i2c/busses/i2c-stm32f7.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> > index 579b30581725..0d3c9a041b56 100644
> > --- a/drivers/i2c/busses/i2c-stm32f7.c
> > +++ b/drivers/i2c/busses/i2c-stm32f7.c
> > @@ -1059,9 +1059,10 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
> >  	/* Configure PEC */
> >  	if ((flags & I2C_CLIENT_PEC) && f7_msg->size != I2C_SMBUS_QUICK) {
> >  		cr1 |= STM32F7_I2C_CR1_PECEN;
> > -		cr2 |= STM32F7_I2C_CR2_PECBYTE;
> > -		if (!f7_msg->read_write)
> > +		if (!f7_msg->read_write) {
> > +			cr2 |= STM32F7_I2C_CR2_PECBYTE;
> >  			f7_msg->count++;
> > +		}
> >  	} else {
> >  		cr1 &= ~STM32F7_I2C_CR1_PECEN;
> >  		cr2 &= ~STM32F7_I2C_CR2_PECBYTE;
> > @@ -1149,8 +1150,10 @@ static void stm32f7_i2c_smbus_rep_start(struct stm32f7_i2c_dev *i2c_dev)
> >  	f7_msg->stop = true;
> >  
> >  	/* Add one byte for PEC if needed */
> > -	if (cr1 & STM32F7_I2C_CR1_PECEN)
> > +	if (cr1 & STM32F7_I2C_CR1_PECEN) {
> > +		cr2 |= STM32F7_I2C_CR2_PECBYTE;
> >  		f7_msg->count++;
> > +	}
> >  
> >  	/* Set number of bytes to be transferred */
> >  	cr2 &= ~(STM32F7_I2C_CR2_NBYTES_MASK);
> > -- 
> > 2.25.1
> > 
