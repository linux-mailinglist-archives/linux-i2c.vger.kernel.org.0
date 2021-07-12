Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6016B3C5A79
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 13:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbhGLKBY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 06:01:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47794 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbhGLKBP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jul 2021 06:01:15 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2671921CC2;
        Mon, 12 Jul 2021 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626083905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tN+/jQcb9wt27oZiUX+cr+yWa0ndh+jabpTzive6u7A=;
        b=KMPN7ng7bXK8jza4Yx9MBpdC5uXpbJHBdvagf/Cu3OkZFRKh0RM1Iz8f9O5Nlg0DAYpv7X
        dmPCz+buGs2ehF8WtCTnnybngUhbUl61Jyc3BezGFLAhtSA4LDBN9mebM1aSW8JV/OWTi5
        MPJpJWwVbBQlfb8X0iLUlmblEVfTr/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626083905;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tN+/jQcb9wt27oZiUX+cr+yWa0ndh+jabpTzive6u7A=;
        b=1f8YCOCy6pCmWYtX0/qFVPx5IO2Z8nrgf0/6VFpDkQiskOptLD3VkgkCBV79dSPmte09YW
        lKmyfvJDuRDMblAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0A5413B1D;
        Mon, 12 Jul 2021 09:58:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Fqc6NEAS7GDyLQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 12 Jul 2021 09:58:24 +0000
Date:   Mon, 12 Jul 2021 11:58:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 0/7] Rework block read support among i2cget and i2cdump
Message-ID: <20210712115823.74149795@endymion>
In-Reply-To: <YNdIEUpBoToGN7JY@kunai>
References: <20210608172338.0cf520a1@endymion>
        <YNdIEUpBoToGN7JY@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Sat, 26 Jun 2021 17:30:25 +0200, Wolfram Sang wrote:
> > The idea would be to get the first 6 patches in the upcoming i2c-tools
> > v4.3, and apply the 7th patch "later" (either immediately after that
> > release, or some time later, I'm not sure).  
> 
> I agree with this approach.
> 
> I had a glimpse at the patches and think they look good so far. I would
> have squashed patches 1+2, but this minor, of course.

I would have too but patch 1 was submitted by somebody else. I didn't
want to put more changes in it than was required for committing
acceptance, so as to respect the original submission.

-- 
Jean Delvare
SUSE L3 Support
