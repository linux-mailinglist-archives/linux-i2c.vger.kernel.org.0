Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708ED3F9C54
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Aug 2021 18:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhH0QW1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Aug 2021 12:22:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:57750 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhH0QW1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Aug 2021 12:22:27 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7074B22144;
        Fri, 27 Aug 2021 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1630081297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hNiIoEzS2J4MnurxrZvf0q4+sFIR+bxPSQT209tcsAU=;
        b=kRYm/ymccXkqHQOZ55qoymNXZ8rghHLDRErVVKV3w25wKzvEUzhhFQop2P1Ap/fuf3n5KZ
        9+3wAhNDj1jXfCi4nQUSDf93m5dUQORoDCkDwt/0x73gzozvIvFXATQtd/Rf/2PbJhNRsb
        rkQClpkKvVDPPPQXmqIRyruVFl8eE7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1630081297;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hNiIoEzS2J4MnurxrZvf0q4+sFIR+bxPSQT209tcsAU=;
        b=XXVPeOaVVwJ+GzmHzxKbKyUyGNc/5r3XJ08KS/i4Z7klKJ+mt9Q1VXvrdZ4SMypRToDq80
        z3qgK+kK9r35dxAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3909413947;
        Fri, 27 Aug 2021 16:21:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 6aW5ChERKWGqCgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Fri, 27 Aug 2021 16:21:37 +0000
Date:   Fri, 27 Aug 2021 18:21:35 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 8/9] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <20210827182135.1d9670c0@endymion>
In-Reply-To: <8ba091fd-b6ff-e800-1c46-aaf9992f1e03@gmail.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
        <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
        <YRPyUM/nGD3dQv9C@smile.fi.intel.com>
        <8ba091fd-b6ff-e800-1c46-aaf9992f1e03@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner, Andy,

On Wed, 11 Aug 2021 23:05:06 +0200, Heiner Kallweit wrote:
> On 11.08.2021 17:52, Andy Shevchenko wrote:
> > On Fri, Aug 06, 2021 at 11:18:05PM +0200, Heiner Kallweit wrote:  
> >> - Use an initializer for struct i2c_board_info info
> >> - Use dmi_match()
> >> - Simplify loop logic  
> > 
> > I'm wondering if changing this to a DMI match table will give better result.
> > 
> > Something like
> > (Sorry I forgot APIs, but plenty of examples are under PDx86: drivers/platform/x86):
> > 
> > struct dmi_..._id *id;
> > 
> > id = dmi_..._match();
> > if (!id) {
> > 	pci_warn();
> > 	return;
> > }
> > 
> > i2c_new_client_device(...);
> 
> We could do something like the following. Whether it's better may be a
> question of personal taste. I have no strong opinion here and would leave
> it to Jean.
> 
> const struct dmi_system_id lis3_id_table[] = {
>         {
>                 .driver_data = (void *)0x29,
>                 .matches = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
>                 },
>         },
> 	...
> 
> dmi_system_id *id = dmi_first_match(lis3_id_table);
> if (id)
> 	i2c_new_client_device(..., (unsigned int)id->driver_data;
> else
> 	lament()
> 

I gave it an actual try, and must say I'm not convinced. Heiner's patch
is -6 lines of source code and +1 byte on the binary (according to
scripts/bloat-o-meter - ls -l disagrees, don't ask me why). My
suggested alternative (as discussed in the v1 of this patch set,
basically Heiner's patch minus the removal of dmi_product_name) is -3
lines of source code and +17 bytes on the binary, but should be faster
than Heiner's version.

Andy's approach results in an overall increase of the source code by 29
lines and +2582 bytes on the binary. Sure, if you break it down, it's
+2624 data and -42 code, so it does "simplify the code", but that's too
high a price to pay for a marginal code simplification. It also has the
downside of reintroducing a cast from int to pointer and back,
something we were trying to get rid of in another patch of this series.
This could of course be avoided but this would make the patch even
larger.

So thanks, but no thanks. Just because an API exists does not mean you
have to use it in all cases.

I stand on my original position, let's stick to dmi_get_system_info() +
strcmp() as the driver did originally. In other words, don't change
code that has been working for years when the alternatives bring no
clear benefit.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
