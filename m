Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6443C5A69
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 13:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241553AbhGLJzO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 05:55:14 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35536 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241462AbhGLJzN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jul 2021 05:55:13 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E0D601FF6E;
        Mon, 12 Jul 2021 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626083544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f/BlniG2pb2cMsEC+8/8QIhQEkBSKk+Ue9Y2EK8/t5w=;
        b=SpnY5jAemO2yPvx31RIAfZ8ju5flgvDxdaePwBaicXQRJgTbSi6ZN/tdTDuz7158+pam1S
        6aUV/dDZd6s11eCFWJf6KcZmPoHHAKCUamtr6cISoqRze9bRrISS4IhEti1yE2ce0J58AM
        ienZLRBcswcnMrqHeEEC8aUftiOPWfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626083544;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f/BlniG2pb2cMsEC+8/8QIhQEkBSKk+Ue9Y2EK8/t5w=;
        b=YaIWFEvIkzNope2jZVi8W9c1enrWoc6a4dfoeKJvqILz2HYC69II4jfsETIT+EbfcwKGHN
        CVmkdkfLdWsSOOBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F08E13B1D;
        Mon, 12 Jul 2021 09:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id u5aaI9gQ7GATLAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 12 Jul 2021 09:52:24 +0000
Date:   Mon, 12 Jul 2021 11:36:30 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/7] i2cget: Add support for I2C block data
Message-ID: <20210712112737.3bfa6e05@endymion>
In-Reply-To: <YNhOzo6AW4/PwxB+@ninjato>
References: <20210608172338.0cf520a1@endymion>
        <20210608172858.0fbd301f@endymion>
        <YNhOzo6AW4/PwxB+@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 27 Jun 2021 12:11:26 +0200, Wolfram Sang wrote:
> > +		"  LENGTH is the I2C block data length\n");  
> 
> I think it would be good to state the allowed length values. Same for
> patch 2.

Good idea. Done, thanks.

-- 
Jean Delvare
SUSE L3 Support
