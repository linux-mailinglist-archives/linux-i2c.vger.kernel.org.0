Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89601391171
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 09:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbhEZHlB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 03:41:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:47816 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232617AbhEZHlA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 03:41:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622014763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3+MOQOdgoMylUu0XYROaZ4kbW9U4q/l15X6XcNkUedg=;
        b=eCpy8aLDbauUbTvFXXKZKCkGo1F6v4R3Vc4XPR5HWGlFWeJ6iPw8UyYLSvhHKesEusMBFb
        jOrVUUsLR09PX92c6tr6H5VUShay/2uoWOuh1cYGrdvzLV75fG6PiEvNX8Kf4J7Nf4iIqL
        YSzHx+WGkINquz53ACSan+LbJFtBk0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622014763;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3+MOQOdgoMylUu0XYROaZ4kbW9U4q/l15X6XcNkUedg=;
        b=zY0GPSh6VOi8OmXz4wFw4p6AN4eJ548IJpcTL7kVh3yerQE0bZQFxrD24Pi18Xvuh3kffm
        2dVz882A/qFYkRDQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3790DAE20;
        Wed, 26 May 2021 07:39:23 +0000 (UTC)
Date:   Wed, 26 May 2021 09:39:18 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [i2c-tools PATCH] tools: i2cbusses: Handle bus names like
 /dev/i2c-0
Message-ID: <20210526093918.73c40482@endymion>
In-Reply-To: <20210525090612.26157-1-chris.packham@alliedtelesis.co.nz>
References: <20210525090612.26157-1-chris.packham@alliedtelesis.co.nz>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

On Tue, 25 May 2021 21:06:12 +1200, Chris Packham wrote:
> File based tab completion means it's easy to do something like
> i2cdump /dev/i2c-0 0x52. Accept this method of specifying the i2c bus
> device.

I can't really see the value of this change, sorry. You want to use a
longer parameter so you can tab-complete it. The original parameter was
a 1- or 2-digit number, which is faster to type than /d<tab>i2<tab>.
Plus if you have multiple i2c buses, tab completion can't guess which
one you want anyway, so you'll have to type the bus number eventually.

So, what do we actually win here?

-- 
Jean Delvare
SUSE L3 Support
