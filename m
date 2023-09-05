Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06228793246
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 01:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbjIEXIa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 19:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjIEXI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 19:08:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730A7127;
        Tue,  5 Sep 2023 16:08:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A75C433CA;
        Tue,  5 Sep 2023 23:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693955306;
        bh=yN3H3YjGx5djVMJhiiOu/07Irs5mGEfUmfMim+pDEa4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mEeuWyoOBQU+VTAo6R8Q4ja+Cf90rehs0yXAScqj5zpFdDJ0tCoxhx0x0MADlMMuf
         cI2zrpqKtzETpJHDE81r86JNavwMrfBYDGKEkPBfuL13PPHmSmUwIaTLmP2iQc+k3q
         tfbCl2MD2DpHdX2lhTvKLWPhroUfm51DZlZaW80mh1G8fj3zhdI5YCi8q2Y4RQklYA
         BTId4jT8wSPl3xgcKW8w83vImzXesgRYkFQawwKFDkncnFj1V7z78fFRNfwRHGI3/z
         qxf4sfOdpdHoYzuc/03lSMD4wKEG7tkaFLUCxEMhqQzkfSZYffU8Lfrj1g5hif9Tl8
         UG0Fz7QJYimSg==
Date:   Wed, 6 Sep 2023 01:08:21 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Sean Nyekjaer <sean@geanix.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: stm32f7: Add atomic_xfer method to driver
Message-ID: <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
 <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sean,

On Mon, Sep 04, 2023 at 07:29:59AM +0200, Sean Nyekjaer wrote:
> Hi Andy,
> 
> > On 3 Sep 2023, at 14.46, Andi Shyti <andi.shyti@kernel.org> wrote:
> > 
> > Hi Pierre-Yves, Alain,
> > 
> > mind taking a look here?
> > 
> > [...]
> > 
> >> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
> >> u32 dnf_dt;
> >> u32 dnf;
> >> struct stm32f7_i2c_alert *alert;
> >> + bool atomic;
> > 
> > this smells a bit racy here, this works only if the xfer's are
> > always sequential.
> > 
> > What happens when we receive at the same time two xfer's, one
> > atomic and one non atomic?
> 
> From the include/i2c.h:
>  * @master_xfer_atomic: same as @master_xfer. Yet, only using atomic context
>  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
> 
> So it’s only used very late in the shutdown.
> 
> It’s implemented the same way as in:
> drivers/i2c/busses/i2c-imx.c
> drivers/i2c/busses/i2c-meson.c
> drivers/i2c/busses/i2c-mv64xxx.c
> drivers/i2c/busses/i2c-tegra.c
> … etc…
> 
> 
> In drivers/i2c/i2c-core.h it’s determined whether it’s atomic transfer or not:
> 
> /*
>  * We only allow atomic transfers for very late communication, e.g. to access a
>  * PMIC when powering down. Atomic transfers are a corner case and not for
>  * generic use!
>  */
> static inline bool i2c_in_atomic_xfer_mode(void)
> {
>         return system_state > SYSTEM_RUNNING && irqs_disabled();
> }
> 
> So you would not have an atomic transfer and later an non atomic.

What about the opposite? I.e. a non atomic and later an atomic,
for very late tardive communications :)

Andi
