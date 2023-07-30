Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9877686DB
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jul 2023 19:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjG3Rtl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jul 2023 13:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjG3Rtk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jul 2023 13:49:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F3E103;
        Sun, 30 Jul 2023 10:49:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ABAD760CEB;
        Sun, 30 Jul 2023 17:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB04C433C7;
        Sun, 30 Jul 2023 17:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690739378;
        bh=BFXGx1j2qWD6Pge+tz0jzNDQdNlCTwlDsesEGFQFsa8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UveM2nWfwnRQxqt+6BLNLWh9LKumKVq1Cfzl2SMTm5HBI2YMf62u5f/WmutilFPBY
         aTr6WpCV4i9FHgQlUAEnfXkbOWXWc3gn7qu/jEZ7dyhq9qeI6LS9YoRHS3d/PKWthZ
         obKOEbSgq9AHKcn1sxfIzGZGdlfhd+1ebbA1gupf+Hup06D0GSpdHy+Kfyg+ufsimI
         K5f+Yh3z/ktqtiqfpYmaxg3YTUfc7WBUL4QMoN7Bb+Jd6STGYZHKCVv6i8bKSADEV+
         oX8/iU6Z3TGMXLLQAKVVaxWzkuhP6/EqIU+xhiFeBHfj8YoQP0qBFmkIUuh4d+1AFq
         0SKAlbvr77vZw==
Date:   Sun, 30 Jul 2023 19:49:34 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] GPIO-based hotplug i2c bus
Message-ID: <20230730174934.vobmyhubi7jsqzjv@intel.intel>
References: <20230729160857.6332-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230729160857.6332-1-clamor95@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Svyatoslav,

On Sat, Jul 29, 2023 at 07:08:55PM +0300, Svyatoslav Ryhel wrote:
> ASUS Transformers require this driver for proper work with their dock.
> Dock is controlled by EC and its presence is detected by a GPIO.
> 
> The Transformers have a connector that's used for USB, charging or
> for attaching a keyboard (called a dock; it also has a battery and
> a touchpad). This connector probably (I don't have the means to verify
> that) has an I2C bus lines and a "detect" line (pulled low on the dock
> side) among the pins. I guess there is either no additional chip or
> a transparent bridge/buffer chip, but nothing that could be controlled
> by software. For DT this setup could be modelled like an I2C gate or
> a 2-port mux with enable joining two I2C buses (one "closer" to the
> CPU as a parent).
> 
> In this case it's hard to tell the difference if this is real or virtual
> hardware.

How did you test this device?

> This patchset is a predecessor of a possible larger patchset which
> should bring support for a asus-ec, an i2c mfd device programmed by
> Asus for their Transformers tablet line. Similar approach is used in
> Microsoft Surface RT for attachable Type Cover.

Would be nice to have a driver using this support in the series,
otherwise it looks like thrown there without any use. Do you have
any use of it already? Even in your private repository just to
take a look.

Thanks,
Andi
