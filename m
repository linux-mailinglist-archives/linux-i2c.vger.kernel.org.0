Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02347909B2
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 23:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbjIBVIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 17:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234956AbjIBVIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 17:08:47 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2266410DE;
        Sat,  2 Sep 2023 14:08:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 32293CE25EB;
        Sat,  2 Sep 2023 21:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D39AC433C8;
        Sat,  2 Sep 2023 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693688910;
        bh=SH6r745vJzzCf7uOsD/HdoMt8U2Z2fzucgfv5jLD0c8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDZWtGOupHlnksMNCqpN0T193mAa76uC+5MmA6zvlWWNTSwQfnh80/H7Ig+sAUxGt
         DD18y6btBp7auexmz7s+J/JzDmzsPeXMaJ0koAtrO6tkmKdGUFBvVyAJOG+jvKJLYU
         loflK+7wZNN/dijerVPXkLQQNiheZLXTJV8pAFyDSO/WQIQpitofmZqVnlAYWKxXB8
         zQumbshrKpncVzBeJ6X6nK2Zgu0wT5w8115XUrc1tqsR2dR/I+xeF7Q8R39n4mMIQp
         yGJLmd0l2PJJxC5XOnN9Q5hawBMJsi8eqKRLQGIkOif8AOMkR4Odn2bpfOeK2ePKas
         4GVsNvb7zPspw==
Date:   Sat, 2 Sep 2023 23:08:27 +0200
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
Message-ID: <20230902210827.7vey3qehpb6gn4m5@zenone.zhora.eu>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-5-Huangzheng.Lai@unisoc.com>
 <CAAfSe-vGXco2PaLEdb8cTAEkX4db3o6v++hz-vL3o00i=7_wgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfSe-vGXco2PaLEdb8cTAEkX4db3o6v++hz-vL3o00i=7_wgw@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chunyan,

[...]

> > When IIC-slaves supporting different frequencies use the same IIC
> 
> %s/I2C/IIC

[...]

> >  #define SPRD_I2C_PM_TIMEOUT    1000
> >  /* timeout (ms) for transfer message */
> >  #define I2C_XFER_TIMEOUT       1000
> > -
> > +/* dynamic modify clk_freq flag  */
> > +#define        I2C_3M4_FLAG            0x0100
> 
> #define <space> I2C_3M4_FLAG <tab> 0x0100
> 
> > +#define        I2C_1M_FLAG             0x0080
> > +#define        I2C_400K_FLAG           0x0040
> > +
> > +#define        I2C_FREQ_400K           400000
> > +#define        I2C_FREQ_1M             1000000
> > +#define        I2C_FREQ_3_4M           3400000
> 
> ditto

why should he use IIC instead of I2C. The file's defines start
with I2C, for consistency he should use the same prefix.

Andi
