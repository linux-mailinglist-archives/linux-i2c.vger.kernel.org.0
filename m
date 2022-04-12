Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9094FE006
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 14:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346358AbiDLMad (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 08:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354303AbiDLM22 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 08:28:28 -0400
X-Greylist: delayed 344 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Apr 2022 04:40:26 PDT
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B2E3A71A;
        Tue, 12 Apr 2022 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
        t=1649763278; bh=zpeerSXmbG/t+M5drVYbi8mhlf53wi2ByStwNHLIGBM=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=Zln2DnULEY4CpEK+7gh7m/jRAB1NSzcRbVjzhCauEFtG/4Asr827YJayxSvaDS/hm
         etLqS53Fy7csDocrQUPX80D7bxOVFjlNxwJGcYPs1U5K88zCsEAsKwq2LmevMyMYC7
         wyOiNf6buZWAYO5FUz2Lp3OLlAgCsbx7QthmpqI0=
Date:   Tue, 12 Apr 2022 13:34:38 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>
To:     Jarrah <kernel@undef.tools>
Cc:     Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 3/5] Input: pinephone-keyboard - Build in the default
 keymap
Message-ID: <20220412113438.eeuptiner7lrzfpl@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
        Jarrah <kernel@undef.tools>, Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-4-samuel@sholland.org>
 <bde4ae40-98b6-7a77-2059-33c34442b604@undef.tools>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bde4ae40-98b6-7a77-2059-33c34442b604@undef.tools>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 12, 2022 at 08:20:24PM +1000, Jarrah wrote:
> 
> On 1/30/22 10:00, Samuel Holland wrote:
> > +
> > +static const uint32_t ppkb_default_fn_keymap[] = {
> > +	KEY(0,  0, KEY_FN_ESC),
> > +	KEY(0,  1, KEY_F1),
> > +	KEY(0,  2, KEY_F2),
> > +	KEY(0,  3, KEY_F3),
> > +	KEY(0,  4, KEY_F4),
> > +	KEY(0,  5, KEY_F5),
> > +	KEY(0,  6, KEY_F6),
> > +	KEY(0,  7, KEY_F7),
> > +	KEY(0,  8, KEY_F8),
> > +	KEY(0,  9, KEY_F9),
> > +	KEY(0, 10, KEY_F10),
> > +	KEY(0, 11, KEY_DELETE),
> > +
> > +	KEY(2,  0, KEY_SYSRQ),
> > +	KEY(2, 10, KEY_INSERT),
> > +
> 
> 
> The driver currently being patched into most distros supporting the keyboard
> exposes the symbols printed on the keyboard rather than the F* keys on the
> function layer. While I agree than exposing function keys on the Fn layer is
> more logical, in practice running this patch for a day I've found it's far
> more useful to have quick access to the standard set of symbols (such as |
> and -) than to have the function keys.
> 
> Would it be possible to either set the default back to symbols or expose
> another layer (potentially under the "pine" key)? An alternative solution
> proposed on the Mobian issue for this was to add a module option, allowing
> these to be switched at runtime rather than compile time.

You will not get access to all the symbols anyway, this way. You should solve
this via xkb and kernel keymaps (man keymaps(5)). Normal users should not be
modifying basic keymap in DT or the driver anyway.

kind regards,
	o.
