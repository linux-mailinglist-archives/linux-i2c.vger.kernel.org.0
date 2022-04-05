Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099474F6510
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 18:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237147AbiDFQPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 12:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237236AbiDFQPP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 12:15:15 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CABA3E37FB;
        Tue,  5 Apr 2022 21:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649218307; x=1680754307;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cR9iKxrz/8HA3dd1/jwZRF3XG6WX3t9oScAc0DPOnW8=;
  b=Qhr3ZgcT6AghAGdmMiC42Yq+xjXtn3ha0USfQQjyMEydVBDv0FC4Afip
   QdNUZQ5q7U+avhoyBYeNyTjKoqHwy+n23gZMIHzRPszfWR/i5RRVn9FAA
   ivTGW0i/EvCYdBLPQvqQOYItX+SyA2zvCLZ/mNieoxs8FT4MbVJm9nC/C
   a9ayqykO7f69eBEIwUcKcPSD+CVQsymH20Nr3ySz9Zj6Ag6I/EYxD7+A4
   m/MYFj82grrvtlc+Q/5JvURh0DZ0wzaeJArpjZFZUwgo4zPIIwuEOqryq
   l+kWxm2bsTJyg/7HHWH44kRAvhEqy+H1bV212Gk/aG7KTZUvU9SM7g5uW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="241530382"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="241530382"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 21:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="524294591"
Received: from unknown (HELO localhost.localdomain) ([10.23.185.145])
  by orsmga006.jf.intel.com with ESMTP; 05 Apr 2022 21:11:44 -0700
Message-ID: <f3b6524f899f2775e630dee2ad1cc4c4c389b2fe.camel@intel.com>
Subject: Re: [PATCH] i2c: ismt: Remove useless DMA-32 fallback configuration
From:   Seth Heasley <seth.heasley@intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Neil Horman <nhorman@tuxdriver.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org,
        seth.heasley@intel.com
Date:   Tue, 05 Apr 2022 14:13:04 -0700
In-Reply-To: <YgEtUT7Dhntmidxy@shikoro>
References: <853d9f9d746864435abf93dfc822fccac5b04f37.1641731339.git.christophe.jaillet@wanadoo.fr>
         <YgEtUT7Dhntmidxy@shikoro>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2022-02-07 at 15:31 +0100, Wolfram Sang wrote:
> On Sun, Jan 09, 2022 at 01:29:45PM +0100, Christophe JAILLET wrote:
> > As stated in [1], dma_set_mask() with a 64-bit mask never fails if
> > dev->dma_mask is non-NULL.
> > So, if it fails, the 32 bits case will also fail for the same
> > reason.
> > 
> > 
> > Simplify code and remove some dead code accordingly.
> > 
> > [1]: https://lkml.org/lkml/2021/6/7/398
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Seth Heasley <seth.heasley@intel.com>
> 
> Seth, Neil, do you agree?

Yes, I agree this change makes sense.

> 
> > ---
> >  drivers/i2c/busses/i2c-ismt.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-ismt.c
> > b/drivers/i2c/busses/i2c-ismt.c
> > index f4820fd3dc13..951f3511afaa 100644
> > --- a/drivers/i2c/busses/i2c-ismt.c
> > +++ b/drivers/i2c/busses/i2c-ismt.c
> > @@ -920,11 +920,8 @@ ismt_probe(struct pci_dev *pdev, const struct
> > pci_device_id *id)
> >  
> >  	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> >  	if (err) {
> > -		err = dma_set_mask_and_coherent(&pdev->dev,
> > DMA_BIT_MASK(32));
> > -		if (err) {
> > -			dev_err(&pdev->dev, "dma_set_mask fail\n");
> > -			return -ENODEV;
> > -		}
> > +		dev_err(&pdev->dev, "dma_set_mask fail\n");
> > +		return -ENODEV;
> >  	}
> >  
> >  	err = ismt_dev_init(priv);
> > -- 
> > 2.32.0
> > 

