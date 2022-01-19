Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08714493941
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 12:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353996AbiASLJg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 06:09:36 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:42294 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353333AbiASLJd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 06:09:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1A5291F384;
        Wed, 19 Jan 2022 11:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642590572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NPdJAOJzkl1G+0jdrgawgyTdBSsTzzNKBAoUQ+NrFdE=;
        b=k4bVlFQ+2G8/i/oxF1ZfgADahWcGG6Zcp0yxUXbAIkniBavDcOYWkBMng0zBzkX6rWPOCv
        FLz3LuiewS4fmWcDpXbh11m3ueaOSa7mSwg609d8JCb7obt0PbcPn2H1KBHIX0rh7uTX1Z
        B0reSHkHMuw7t2Uxapy8MgmpvE4MTVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642590572;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NPdJAOJzkl1G+0jdrgawgyTdBSsTzzNKBAoUQ+NrFdE=;
        b=YuyGwl+Rj6juzx9CnuIQ4ijuk7WwmPKTiRpU/uz5PePZZ0CNpU4JXaLkKepZB2DS/zJfVv
        3e75781ZcbHrNsDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3EF813B4A;
        Wed, 19 Jan 2022 11:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id vsYXMWvx52GDXwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 19 Jan 2022 11:09:31 +0000
Date:   Wed, 19 Jan 2022 12:09:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Ross Burton <Ross.Burton@arm.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] py-smbus/setup.py: use setuptools instead of distutils
Message-ID: <20220119120930.504c5818@endymion>
In-Reply-To: <E663CBEF-A063-4D0E-A983-CC6D93259D54@arm.com>
References: <20220114134910.3994688-1-ross.burton@arm.com>
        <20220118131131.388e5d3c@endymion>
        <E663CBEF-A063-4D0E-A983-CC6D93259D54@arm.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Jan 2022 16:50:56 +0000, Ross Burton wrote:
> > Is setuptools available in python 2.7? For now, py-smbus can be built
> > for either python2 or python3, and I would like to maintain that
> > possibility.  
> 
> Yes, it is.

Patch applied then, thanks for your contribution.

-- 
Jean Delvare
SUSE L3 Support
