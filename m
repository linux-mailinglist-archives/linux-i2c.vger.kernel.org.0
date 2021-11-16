Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA776452EE1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 11:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhKPKWO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Nov 2021 05:22:14 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:45552 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbhKPKVU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Nov 2021 05:21:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 4D787212C8;
        Tue, 16 Nov 2021 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637057903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JZNotH4MhP4IRqUljB1EhjoGVEhettHZe/9E+z6YmQ0=;
        b=v2o+9r+FvGTRojafLqsazDsK8guTamynCfqIk6u6oeMjbdd/l4lNWl9Sd9anp9BfLyQakv
        Xla8AK1drArgo30yW+QlOfZk1crGN2HLXI/WmifHUvSwEeUAXnYNrMhKujvfq5RYlbhJ7v
        TR6vjdZpVFmbDMYFgmvxrQe54j2LD9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637057903;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JZNotH4MhP4IRqUljB1EhjoGVEhettHZe/9E+z6YmQ0=;
        b=B1J73o/HRHBClAQNc6NIonIdPTtCfszSGBwwxg23fFq1eYOVmN3N09knKhCp38xuV7P2eL
        uPUW6U3inUBiM3Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFD6813BA1;
        Tue, 16 Nov 2021 10:18:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8odEOG6Fk2EyJAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 16 Nov 2021 10:18:22 +0000
Date:   Tue, 16 Nov 2021 11:18:21 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: Re: [PATCH v3] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Message-ID: <20211116111821.75ba4ea6@endymion>
In-Reply-To: <71a5c6d4-4ae8-2c54-78e7-94a37b43a986@linux.intel.com>
References: <20211110141032.2429745-1-jarkko.nikula@linux.intel.com>
        <YYv+YdRWzU9HzEY8@smile.fi.intel.com>
        <71a5c6d4-4ae8-2c54-78e7-94a37b43a986@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 11 Nov 2021 16:39:28 +0200, Jarkko Nikula wrote:
> On 11/10/21 7:16 PM, Andy Shevchenko wrote:
> > On Wed, Nov 10, 2021 at 04:10:32PM +0200, Jarkko Nikula wrote:  
> >>  	/*
> >> -	 * Clear irq sources and report transaction result.
> >> +	 * Clear remaining irq sources: Completion of last command, errors  
> >> +	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
> >> +	 * assertion independently is the interrupt generation blocked or not  
> > 
> > is --> if ?
>
> hmm, I don't know which one is correct or neither. Or should it be 
> something like "independently of whether the interrupt generation is 
> blocked or not"? Grammar polices, please help me :-)

... independently of the interrupt generation being blocked or not.

Sounds better?

(I think your "of whether" variant is grammatically correct too, if you
prefer that.)

-- 
Jean Delvare
SUSE L3 Support
