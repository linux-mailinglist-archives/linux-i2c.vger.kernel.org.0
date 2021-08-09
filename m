Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (unknown [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225333E46B4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Aug 2021 15:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhHINd1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Aug 2021 09:33:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:56742 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbhHINd1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Aug 2021 09:33:27 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E0DA121E49;
        Mon,  9 Aug 2021 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628515985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=US+mNDATP9Uh06skimCGI7/eg+5ZROiNrDcAtgyNJs8=;
        b=WHPWl4yXAp1KXvdNKtdSI3J1fDiQ+jqjQEQ+x2hNy4g3pNIhF22pfDuJbrlfDbwNVxJrU8
        9s418+D+8zeLArF7KwJVZjV0A6uYGJaufyWQbGL+iEAu8FA7ceHRt7K2MerM7iyyQuEbK1
        fpNaYAVRuDXqIT2D1S5EQylmH75YxTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628515985;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=US+mNDATP9Uh06skimCGI7/eg+5ZROiNrDcAtgyNJs8=;
        b=jNCvUQB/qVsmiAnwaqHwB4WvDXCRJRaIqfzwj7hCVRtfUO5kV2Wb5FNhdPiWR7GOjfd4Ib
        T19ucdHutV5/heDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C037F136C1;
        Mon,  9 Aug 2021 13:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id miCwLJEuEWEadgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Mon, 09 Aug 2021 13:33:05 +0000
Date:   Mon, 9 Aug 2021 15:33:04 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 09/10] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <20210809153304.2944d07a@endymion>
In-Reply-To: <72f456d2-8b6c-16b1-23c6-e117bbf5b3ee@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <5d8e72e2-085b-32ea-0a86-eeecfe1e94f3@gmail.com>
 <20210805162309.14dbaf63@endymion>
 <72f456d2-8b6c-16b1-23c6-e117bbf5b3ee@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Fri, 6 Aug 2021 22:49:00 +0200, Heiner Kallweit wrote:
> On 05.08.2021 16:23, Jean Delvare wrote:
> > On Sun, 01 Aug 2021 16:23:34 +0200, Heiner Kallweit wrote:  
> >> +		if (dmi_match(DMI_PRODUCT_NAME, dell_lis3lv02d_devices[i].dmi_product_name)) {  
> > 
> > This causes dmi_get_system_info(DMI_PRODUCT_NAME) to be called for
> > every iteration of the loop, slowing down the lookup. It's an exported
> > function so it can't be inlined by the compiler. I know this happens
> > only once, but we try to keep boot times as short as possible.
> >   
> I'm aware of this. However we just talk about a small in-memory operation and
> the performance impact should be neglectable. dmi_get_system_info() is just
> the following:
> 
> const char *dmi_get_system_info(int field)
> {
> 	return dmi_ident[field];
> }
> EXPORT_SYMBOL(dmi_get_system_info);
> 
> I'd rate the simpler and better maintainable code higher.
> But that's just a personal opinion and mileage may vary.

I'm not worried about multiple calls to dmi_get_system_info(), which is
indeed simple and inlined anyway, but about multiple calls to dmi_match
(which can't be inlined). Function calls have a high cost (which is the
very reason why the compiler will try to inline functions whenever
possible).

I wouldn't mind if you were replacing several lines of code,
but here you are only removing one local variable and one simple line
of code, or 15 bytes of binary code total. But you add up to 8 function
calls, and that number could grow in the future as we add support for
more devices. That's why I say the benefit of the change is
questionable.

If it was new code, I probably wouldn't mind. But when changing
existing code, I need to be convinced that the new code is
unquestionably better than what we had before. That's not the case here.

(And don't get me wrong, I would love to live in a world where you don't
have do choose between best performance and and systematic use of
existing APIs. Alas, we often have to make choices in either direction.)

-- 
Jean Delvare
SUSE L3 Support
