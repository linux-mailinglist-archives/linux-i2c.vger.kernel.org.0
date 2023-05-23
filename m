Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E502570E452
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 20:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237403AbjEWSDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 14:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbjEWSDy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 14:03:54 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468C197;
        Tue, 23 May 2023 11:03:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id F08CC229FD;
        Tue, 23 May 2023 18:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684865031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QIKXE18YCt2a5EaIfrPTcuzVpMr14MFcJX+6a1jLsJE=;
        b=mqE1HN+2G9ZRAmRwAvYxxkejhwssTMsB4PU/QrTFcDC62D6YDlgdFTH+y12iScA317uLt6
        q3kqW3COqvCTnFUOxDowHATGID+IJqZTelS6o5lrk852blgvQGb8eHz9p12aLEUoyIG3a3
        Q2XZuxblwNzgFMRW2OdZABxirD4HLhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684865031;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QIKXE18YCt2a5EaIfrPTcuzVpMr14MFcJX+6a1jLsJE=;
        b=WGRryJIJusqiBWnmygCZnvGAOT/NmE0g8tgrK2Le5F4rEF617unFLV0w4GXvtMfpirIW2K
        DNs/K/MZ7d7mIhBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2FE713A10;
        Tue, 23 May 2023 18:03:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id zrpELQcAbWR9QgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 23 May 2023 18:03:51 +0000
Date:   Tue, 23 May 2023 20:03:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Marius Hoch <mail@mariushoch.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Message-ID: <20230523200350.62ab4788@endymion.delvare>
In-Reply-To: <20230514103634.235917-1-mail@mariushoch.de>
References: <20230514103634.235917-1-mail@mariushoch.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marius,

On Sun, 14 May 2023 12:36:32 +0200, Marius Hoch wrote:
> The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
> but also claims that the SMBus uses IRQ 18. This will
> result in:
> 
> i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
> i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
> i801_smbus: probe of 0000:00:1f.3 failed with error -16

The i2c-i801 driver supports shared IRQ. If this fails, this means that
the other driver is not passing IRQF_SHARED when registering the
interrupt. Which driver is this? I'd rather check whether sharing the
IRQ is possible, rather that falling back to polling, which has a
performance cost.

> Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
> we fall back to polling, which also seems to be what the (very
> dated) Windows 7 drivers on the Dell Latitude E7450 do.

What makes you think so?

-- 
Jean Delvare
SUSE L3 Support
