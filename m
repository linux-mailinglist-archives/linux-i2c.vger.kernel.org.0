Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D475879DF5A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 07:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjIMFNj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 01:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjIMFNi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 01:13:38 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A662A172A
        for <linux-i2c@vger.kernel.org>; Tue, 12 Sep 2023 22:13:34 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0790D1F385;
        Wed, 13 Sep 2023 05:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1694582012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h6PG5TYJTEu96yUnwpPOsoK2M9wklWwqmP6HnayPqSA=;
        b=coHdJBrz6hcyHu2/D+o7/PMiralB5XUF6cO+p5OtTw55hpTEEsgHGhbvnNHk2TMYLBGF6k
        7fjmXbef4rikr3oEAXGZgjatuzzJ4h8J4CfsdFm71IZXuPqol8JnFKrJMC0sAA/YkJvz8P
        g6/pkarCraiZsPZ2/TRFcRQj6nmn10A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1694582012;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h6PG5TYJTEu96yUnwpPOsoK2M9wklWwqmP6HnayPqSA=;
        b=tYUaUqSrX5DzjI+Dmaa21J6ZcAlWV7yMzOVekX7gssBzH8vHUXfzaemYdvOFRTvZyc785z
        uz6GJbiTKVedtKCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D550213582;
        Wed, 13 Sep 2023 05:13:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id taJjMvtEAWU5SQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 13 Sep 2023 05:13:31 +0000
Date:   Wed, 13 Sep 2023 07:13:30 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <20230913071330.7e9938fb@endymion.delvare>
In-Reply-To: <205f1930-f26c-9533-ef09-e37377d9ef10@gmail.com>
References: <205f1930-f26c-9533-ef09-e37377d9ef10@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 09 Sep 2023 22:25:06 +0200, Heiner Kallweit wrote:
> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> receiving the last byte. If we get e.g. preempted before setting
> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> before SMBHSTCNT_LAST_BYTE is set.
> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> is also consistent with what we do in i801_isr_byte_done().
> 
> Reported-by: Jean Delvare <jdelvare@suse.com>
> Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/
> Cc: stable@vger.kernel.org
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
