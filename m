Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BAF72B94C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 09:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234580AbjFLH4c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 03:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236093AbjFLH4C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 03:56:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBE3170D
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 00:55:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 01D22613E9
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 07:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6333C433D2;
        Mon, 12 Jun 2023 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686556495;
        bh=RkpI8fT67p75Z512wRXhJISmUqOe2UC4PFsDjKP+0rE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vMq3IMn/lJflObHlgaHgNOM22T5OnHAMuAsr0cFIaifjLYWRtKQtgT8I+fpInH7/U
         C5xRKjOIc/vWh6RxhAVXLvQaG4575SVtWtAkpEEv/HPzVyq1FeM6lvYO2YxrPz98Mr
         1Y2Kn4evSV9v+fu72Du4cpYh4fMz/O6QmbGpkj3rLOGP37a6MeqAdE8NnNOFFTVqWS
         T8ADhgCFvcfJOFrG5m755SoEHJ5d3Iwl0qdigidYFYGJ1Bw+xkeJbf2j6R3dsfd35u
         R2aTTf6yxkrd16BZxdoAyMHU8quZyXMHoCFkzjtSUJpa+vz74fhyPLm6Qio8QWSZIj
         z5AzTsjQ4a8/g==
Date:   Mon, 12 Jun 2023 09:54:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 01/15] i2c: busses: emev2: Use devm_clk_get_enabled()
Message-ID: <20230612075452.xfjhtz5mfwja544i@intel.intel>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-2-andi.shyti@kernel.org>
 <CAMuHMdX7-MDrpxNyoLWfDKsZRn2-GafSfgADKkF20mqtpLhwng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX7-MDrpxNyoLWfDKsZRn2-GafSfgADKkF20mqtpLhwng@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

> > --- a/drivers/i2c/busses/i2c-emev2.c
> > +++ b/drivers/i2c/busses/i2c-emev2.c
> > @@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pdev)
> >
> >         strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
> >
> > -       priv->sclk = devm_clk_get(&pdev->dev, "sclk");
> > +       priv->sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
> >         if (IS_ERR(priv->sclk))
> >                 return PTR_ERR(priv->sclk);
> 
> After this, priv->sclk is unused, so you can replace em_i2c_device.sclk
> by a local variable.

good point! Will send it again. Thanks!

Andi
