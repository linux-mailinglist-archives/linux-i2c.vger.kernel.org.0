Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A5A4B6644
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 09:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbiBOIhy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 03:37:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbiBOIhy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 03:37:54 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15215D21EF;
        Tue, 15 Feb 2022 00:37:45 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C3BE01F38A;
        Tue, 15 Feb 2022 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644914263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uzVwnsIjLssBzWGNB+hpjSkudu31HwVtVfUXyPW31Kw=;
        b=s9cA6alHMUL97Q96ZVtT9w6GSFm/ZvnTBfgEWz4z8rfIjBclBgEVRljFL+2uv5eU900Ptm
        XP+A4xaR/lFntW85uwFttLGG4zAVHWWGrCdT2xMjnLIxpbwQ/o6sjZ36i7zZqeww9CQ4di
        tWju+GvmphBAXmZc6/I677RqGZEqw5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644914263;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uzVwnsIjLssBzWGNB+hpjSkudu31HwVtVfUXyPW31Kw=;
        b=3RLD1E+vgmzgP5oqMWYXycbjaCblXe9GzLkn14qpwTzvslraHD6LplePL1TfzFf0Idc87i
        3x/E6S74oq7dyuAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AE8413BE8;
        Tue, 15 Feb 2022 08:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id s4tuEFdmC2LlYwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 15 Feb 2022 08:37:43 +0000
Date:   Tue, 15 Feb 2022 09:37:42 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v5 3/9] i2c: piix4: Move port I/O region request/release
 code into functions
Message-ID: <20220215093742.3f3894c5@endymion.delvare>
In-Reply-To: <YgZ12hCMUlqtLKD3@kunai>
References: <20220209172717.178813-1-terry.bowman@amd.com>
        <20220209172717.178813-4-terry.bowman@amd.com>
        <20220211105322.180ad89d@endymion.delvare>
        <YgZ12hCMUlqtLKD3@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 11 Feb 2022 15:42:34 +0100, Wolfram Sang wrote:
> > > +		if (retval)  
> > 
> > Missing curly brace here, breaks the build.  
> 
> Bummer, need to check why this wasn't found by my build-testing.

Maybe you build-tested the series as a whole but not individual
patches? The series did build fine, as the missing curly brace was
added back in a later patch.

-- 
Jean Delvare
SUSE L3 Support
