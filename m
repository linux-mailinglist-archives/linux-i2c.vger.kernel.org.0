Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEBD793248
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 01:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237172AbjIEXKw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 19:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjIEXKw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 19:10:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A74BD2;
        Tue,  5 Sep 2023 16:10:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FB3C433CA;
        Tue,  5 Sep 2023 23:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693955448;
        bh=RcX2c6NMuKvoYtEVMtow5ReacwbkGTn/OgoobkDV9Qs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o4zXFXfaHB+78vQw3MXB1Wb5g+8Cr4FVGnq8nzAdGwE1yT4LqyoEAi+Tk92EE81Ok
         NSM3dDHetI6ujnkeVhZjDVyvGNBNriEdl0u+XytYp4HhAk0oz/a4TDwIRkQA8LiDD2
         NXUamNrEfuueQlpRn7loIDZVerOdbt38UhIo5MP8mRynX/IsrsQoi1SaR+HrmHSMMq
         1qZgchTa0NZ2xsC/cMQCz4H6bHazCpYp7cU7WUn9FypNXGlO4LncQNk56Ck6x9qNiJ
         dD1H4wN5OZJjf+Osv5KnBxMzqU3RSh6EoyCklyJkgCQM/reM054tDln0jiIYaymzL1
         BlEdL9KAviA5w==
Date:   Wed, 6 Sep 2023 01:10:44 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 4/8] i2c: sprd: Add IIC controller driver to support
 dynamic switching of 400K/1M/3.4M frequency
Message-ID: <20230905231044.hz5srccpvarkygul@zenone.zhora.eu>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-5-Huangzheng.Lai@unisoc.com>
 <CAAfSe-vGXco2PaLEdb8cTAEkX4db3o6v++hz-vL3o00i=7_wgw@mail.gmail.com>
 <20230902210827.7vey3qehpb6gn4m5@zenone.zhora.eu>
 <CAAfSe-sEhqggJPhmOmUfLHJ3OCik5fB-qP1+sn66KNLWxOPV_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfSe-sEhqggJPhmOmUfLHJ3OCik5fB-qP1+sn66KNLWxOPV_Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chunyan,

> > > >  #define SPRD_I2C_PM_TIMEOUT    1000
> > > >  /* timeout (ms) for transfer message */
> > > >  #define I2C_XFER_TIMEOUT       1000
> > > > -
> > > > +/* dynamic modify clk_freq flag  */
> > > > +#define        I2C_3M4_FLAG            0x0100
> > >
> > > #define <space> I2C_3M4_FLAG <tab> 0x0100
> > >
> > > > +#define        I2C_1M_FLAG             0x0080
> > > > +#define        I2C_400K_FLAG           0x0040
> > > > +
> > > > +#define        I2C_FREQ_400K           400000
> > > > +#define        I2C_FREQ_1M             1000000
> > > > +#define        I2C_FREQ_3_4M           3400000
> > >
> > > ditto
> 
> I meant "#define <space> I2C_FREQ_3_4M <tab> 3400000"

right! Agree with your comment!

> >
> > why should he use IIC instead of I2C. The file's defines start
> > with I2C, for consistency he should use the same prefix.
> >
> 
> Yes, I agree.

Thanks,
Andi
