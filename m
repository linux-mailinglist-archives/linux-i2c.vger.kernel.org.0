Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1DB6B66F6
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 14:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjCLNsg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 09:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjCLNsg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 09:48:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3497E241DF;
        Sun, 12 Mar 2023 06:48:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4FB660F35;
        Sun, 12 Mar 2023 13:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF52EC433D2;
        Sun, 12 Mar 2023 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678628914;
        bh=QomXKHW+iyRYb+BQXza5wpK8OqUALuUtKqqg/DLAbNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bb2uSEGJaAAk+FpvqEP0O79sw6scL6wcPcyqRBoI4cpccFd0NCkB2mblGydK8c7Hm
         w+R70xpUzMfA+ANfPJmd6cGC3pkIjCdFn3c+Po6p3ixrA/q1gzsYH5moxYJSkilcU7
         +PypUkjWK6EHwDWNBPmdUa6s1b8JesoZQ+8AFMYnIwuZ6YA8to3LfH/7qR9jKswGIn
         ddlDTgQEwIUEZTGXJqZrrOhTmFdUSVQPDkn9pmn7/JREMMqqeijI26Q/1sFaQBRSzW
         A1YPqT5gnYtJVC+iTZgLHpHQcI9ELj8GQBzz82oL5D5HqU0AnpZYIPVyoz7A715Qeo
         0AoskoPT4KoTQ==
Date:   Sun, 12 Mar 2023 14:48:31 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 2/2] i2c: mpc: Use the i2c-scl-clk-low-timeout-ms property
Message-ID: <20230312134831.emvujsk3j5uzbdqa@intel.intel>
References: <20230312131933.248715-1-andi.shyti@kernel.org>
 <20230312131933.248715-3-andi.shyti@kernel.org>
 <e83ccb7d-cc08-181b-e354-af6b1de34ff3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e83ccb7d-cc08-181b-e354-af6b1de34ff3@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On Sun, Mar 12, 2023 at 02:44:47PM +0100, Krzysztof Kozlowski wrote:
> On 12/03/2023 14:19, Andi Shyti wrote:
> > Now we have the i2c-scl-clk-low-timeout-ms property defined in
> > the binding. Use it and remove the previous "fsl,timeout".
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 12 ++++++------
> 
> Ah, and I forgot: bindings are always separate patches from driver
> changes. Cannot be mixed.

Thanks for all your comments, will send a v2.

Andi
