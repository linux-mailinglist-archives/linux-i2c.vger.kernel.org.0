Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07A468A9E9
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Feb 2023 14:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbjBDNHL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Feb 2023 08:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbjBDNHK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Feb 2023 08:07:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9F928D3C;
        Sat,  4 Feb 2023 05:07:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2EAA660C15;
        Sat,  4 Feb 2023 13:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F58C433D2;
        Sat,  4 Feb 2023 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675516019;
        bh=ycQA6TIVYWT6T7kideY47GtSB5IFpufQSUfh98aM9hw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rzUsH9nKp1nOGLMGMQF+eNjzEedbO76CjC9ynoF5PNbdybYWJWhM2nVxKDNLsz82o
         1b1Zi9HdA+skKqjSxs6JIkXf+BJozvkSXJwvPmsCa92Y8yHN+RYEC2IKl4YLIl2c/h
         Njui6+17FU6bfjUZEh69BZ6s+3lx27xwvbHgmePW6D+jeXaRXRL0Om+UPexHfEQfFr
         Cl53qObvs16vRyTuXEJwy1IZX7pI/P3wFl96pfRId8RAs+w/isRFJDNlQGakyZMaLI
         zO5AHqg43SubuxP7jEOkW5ITnuqFdtJw/TTAevkAe9uXbF9WAQpUiwZHJekZ/APLCA
         9YIxnpKn6IrMw==
Date:   Sat, 4 Feb 2023 13:06:04 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend 3/3] extcon: intel-cht-wc: Add support for
 Lenovo Yoga Tab 3 Pro YT3-X90F
Message-ID: <Y95YPH/MqAQdVL7T@google.com>
References: <20230126153823.22146-1-hdegoede@redhat.com>
 <20230126153823.22146-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126153823.22146-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 26 Jan 2023, Hans de Goede wrote:

> The Lenovo Yoga Tab 3 Pro YT3-X90F needs the same handling as
> the Lenovo Yogabook models. That is it needs the extcon code to:
> 
> 1. Control the Vbus regulator and USB-role-switch for the micro-USB
>    port's host/device mode switching.
> 2. Register a power_supply device so that the charger-chip driver can
>    see what sort of charger (SDP/CDP/DCP) is connected.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/extcon/extcon-intel-cht-wc.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
