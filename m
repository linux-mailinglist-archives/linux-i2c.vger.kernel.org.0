Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB91E3982E2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 09:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhFBH0u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 03:26:50 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:35232 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhFBH0t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 03:26:49 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7A0262193D;
        Wed,  2 Jun 2021 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622618706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9tlErMlZM5gf9xuILziR0oHxxVeVriIq/h6p4G9Guyc=;
        b=DPAd51ju/GSD/M4wI7Cjpfs7DTnLDLiAq8+La+hCXEEwHwFauXdDxBcOz6PPylHb7IqvG9
        dro3dEC7dXmBX6pFcdtLzB8xjtNP5bb3VHTOjh2WY5UTICG4qS5cmubgkyohhGn2RN7gSm
        C4zXJALKuDttSGANogd+uXE8DnbsfYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622618706;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9tlErMlZM5gf9xuILziR0oHxxVeVriIq/h6p4G9Guyc=;
        b=/IpsYidIa2sx3/5yO0/mRyAqL3kBK7JqRbffXFAu9mbtdGgxzuK9aMqIvmVkZVxkHfb5CH
        NJIgMZmM8cqPaTDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 3F6E1118DD;
        Wed,  2 Jun 2021 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622618706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9tlErMlZM5gf9xuILziR0oHxxVeVriIq/h6p4G9Guyc=;
        b=DPAd51ju/GSD/M4wI7Cjpfs7DTnLDLiAq8+La+hCXEEwHwFauXdDxBcOz6PPylHb7IqvG9
        dro3dEC7dXmBX6pFcdtLzB8xjtNP5bb3VHTOjh2WY5UTICG4qS5cmubgkyohhGn2RN7gSm
        C4zXJALKuDttSGANogd+uXE8DnbsfYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622618706;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9tlErMlZM5gf9xuILziR0oHxxVeVriIq/h6p4G9Guyc=;
        b=/IpsYidIa2sx3/5yO0/mRyAqL3kBK7JqRbffXFAu9mbtdGgxzuK9aMqIvmVkZVxkHfb5CH
        NJIgMZmM8cqPaTDQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id pCKBDVIyt2DfXQAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Wed, 02 Jun 2021 07:25:06 +0000
Date:   Wed, 2 Jun 2021 09:25:04 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [i2c-tools PATCH] tools: i2cbusses: Handle bus names like
 /dev/i2c-0
Message-ID: <20210602092504.462bc28e@endymion>
In-Reply-To: <a9bce37a-085b-f863-e1b0-5f5faa91f063@alliedtelesis.co.nz>
References: <20210525090612.26157-1-chris.packham@alliedtelesis.co.nz>
 <20210526093918.73c40482@endymion>
 <a9bce37a-085b-f863-e1b0-5f5faa91f063@alliedtelesis.co.nz>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

On Wed, 26 May 2021 21:23:07 +0000, Chris Packham wrote:
> On 26/05/21 7:39 pm, Jean Delvare wrote:
> > I can't really see the value of this change, sorry. You want to use a
> > longer parameter so you can tab-complete it. The original parameter was
> > a 1- or 2-digit number, which is faster to type than /d<tab>i2<tab>.
> > Plus if you have multiple i2c buses, tab completion can't guess which
> > one you want anyway, so you'll have to type the bus number eventually.
> >
> > So, what do we actually win here?  
> 
> My main motivation was to replace an in-house tool that is provides 
> similar functionality but it currently takes the bus as a path. At first 
> I even thought there was a bug because I thought "or an I2C bus name" 
> meant the path, it wasn't until I looked at the code that I realised 
> this was the name used in the kernel.

OK, that's a better explanation. But I'm still not convinced by the
benefit. I'm sure you guys can learn quickly to pass just the i2c bus
number as the first parameter. Plus I don't like your implementation
for various technical reasons anyway (like allocating extra memory for
every bus when you may never actually need it, and hard-coding the
/dev/i2c-<N> pattern when there's at least one alternative supported by
i2c-tools at the moment - although I'm unsure if anyone still uses it).
So I'm not going to apply your patch, sorry.

> One advantage I can see is that the /d<tab>/i2<tab> implicitly validates 
> that the bus actually exists (assuming /dev is managed by devtmpfs 
> and/or udev).

That's not an advantage. Running the command on the wrong I2C bus could
have bad consequences. The only safe way to use the tool without
checking the list of available i2c buses first is to select the I2C bus
by name.

-- 
Jean Delvare
SUSE L3 Support
