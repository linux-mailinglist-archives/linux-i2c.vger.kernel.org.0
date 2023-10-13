Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B23577C821D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 11:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbjJMJeP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 05:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjJMJeO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 05:34:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953ACBD;
        Fri, 13 Oct 2023 02:34:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6354C433C7;
        Fri, 13 Oct 2023 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697189652;
        bh=aqNTWk/jLrgnCA59noQX1Z0OD+kaSq0f7Cj2KJ+dY7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sWMAeeBqIkpI34Z+ITknz6l3Bw/5EvKniAa2W9YT6hM+MssyAs6Z+4VuyQ1LHE9m4
         7K2yz6zc8HBODFAsnlPAViSy5OmwWBWu5JFoTB5i3KtXXu71zbSllc85RQrHQVssCL
         ca0g9xRjkWR7D/3s1fj3nIklhqs24WWQoUpPI+RVfL51wdxZp+XhGkt79fgpaEj1/T
         UVjPymfCA6ZhNSOPZ0SdNBy1MaGznZKwnhs9EtvZIHGU9IftrK6HeeY+dP5URXehs1
         bg2qA3QdcObOy3NQifFNmWh5ItRopcwdJQqrLjRXZ9rB2awpZYD6WTbHgDSOsnRYt9
         BNmevFk8cgr+A==
Date:   Fri, 13 Oct 2023 11:34:07 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Peter Rosin <peda@axentia.se>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Message-ID: <20231013093407.p2oqsagk62vrqacc@zenone.zhora.eu>
References: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
 <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
 <20231012102140.kydfi2tppvhd7bdn@zenone.zhora.eu>
 <63403365-2d23-b4a0-d869-070686d62ab5@axentia.se>
 <812dd506-c61b-4967-9b0b-ea35a111bc7f@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <812dd506-c61b-4967-9b0b-ea35a111bc7f@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

...

>              static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
>             @@ -1083,6 +1084,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>                     if (drv_data->irq < 0)
>                             return drv_data->irq;
> 
>             +       drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
>             +       if (IS_ERR(drv_data->reset_gpio))
>             +               return PTR_ERR(drv_data->reset_gpio);
> 
>         if this optional why are we returning in case of error?
> 
> gpiod_get_optional() will return NULL if the property is not present. The main
> error I care about here is -EPROBE_DEFER but I figure other errors are also
> relevant. This same kind of pattern is used in other drivers.

we already discussed about this, I don't have a strong opinion,
you can leave it as it is... I recon this is a matter of pure
taste.

Would you just mind adding an error message using
dev_err_probe()?

Thanks,
Andi
