Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D21455F25
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 16:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhKRPRc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 10:17:32 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:51694 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhKRPRc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 10:17:32 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8020E1FD29;
        Thu, 18 Nov 2021 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637248471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f+MHfVf1j9MMQluBcgUwMyJUvvcsQfvswi3pv1xZcqA=;
        b=zAYc75BJc7/AZZ+w07xYp0T7KXOG8jrBi49snrVLhfpYOOwoRIrHc/vINoreKEv9m1aRfU
        wRBFedtgGUL8sRsLtD3Q/pVL2w4gWpfQKTuHn71f50edRVfd06i8UYShwwc4CijnI7GJj9
        9iV9AeYDOhgbrueg6yrTbml9Cn1PP8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637248471;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f+MHfVf1j9MMQluBcgUwMyJUvvcsQfvswi3pv1xZcqA=;
        b=XWwaWdMgYd39FsI+/UqkIHYzeNDJZSdu5msAKV5OPF+qASnSh5HgJ4Wucms0C3U3StH8qS
        01CpS+b5B1Ogn4BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 49B8F13D43;
        Thu, 18 Nov 2021 15:14:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wYigD9dtlmGoGQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 18 Nov 2021 15:14:31 +0000
Date:   Thu, 18 Nov 2021 16:14:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] 2c: i801: Improve handling of chip-specific feature
 definitions
Message-ID: <20211118161430.7896a618@endymion>
In-Reply-To: <56d37e6a-a0c0-861b-dfd7-e50b95cd5377@linux.intel.com>
References: <89eb31f3-8544-35c6-7b15-920831746563@gmail.com>
        <20211118110912.76b74cd3@endymion>
        <56d37e6a-a0c0-861b-dfd7-e50b95cd5377@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 Nov 2021 16:03:39 +0200, Jarkko Nikula wrote:
> On 11/18/21 12:09 PM, Jean Delvare wrote:
> > On Mon, 08 Nov 2021 21:10:12 +0100, Heiner Kallweit wrote:  
> >> +#define DEF_FEATURES	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \  
> > 
> > Not a good name ("default" isn't descriptive) and not consistent
> > either. I suggest "FEATURES_82801EB" instead, as this is the first
> > chipset which supported all these features. And you can make the
> > definitions of FEATURES_82801DB and FEATURES_82801EB consistent
> > (spacing/alignment).
> >   
> How about calling default as FEATURES_ICH5 and 82801DB as FEATURES_ICH4? 
> That makes easier to follow comments like "/* ICH4 and later */" in the 
> code.

Good idea :-)

-- 
Jean Delvare
SUSE L3 Support
