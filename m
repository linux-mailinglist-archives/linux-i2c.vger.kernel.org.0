Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6D969997D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 17:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjBPQIg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 11:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBPQIf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 11:08:35 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3F64C3FE
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 08:08:34 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id DF48422905;
        Thu, 16 Feb 2023 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676563711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=aAXOhRWaTGOXMpTphjgFehKd7cylGFcKXCPxFxwu8wM=;
        b=gOrULvkfq4vapVE7sBtB+G/JZh620to5FKvjPDNUFpVg5ADYJViYfROVdOXas7WGPswCvg
        +DLqD8Gq/eYw6R4XYe47KoC/BsslvBv/0/4vJTchMUa98e+32umbt1vcQk6ThLf6jsrtqV
        5Y2xz9/2p5hw60NLBJzDwFbwDMMWMqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676563711;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=aAXOhRWaTGOXMpTphjgFehKd7cylGFcKXCPxFxwu8wM=;
        b=R4NCgpMUXnCGGrK7zf5tQh5TZfBnFULaQUV1/IVaDi0eumwRxFGVdUXxf9nGVICJRcCdyY
        H4uPEHBaeAah9GCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5BAC131FD;
        Thu, 16 Feb 2023 16:08:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6EC4Kv9U7mOxJAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Feb 2023 16:08:31 +0000
Date:   Thu, 16 Feb 2023 17:08:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 0/6] i2c: i801: Series with minor improvements (second
 half)
Message-ID: <20230216170830.206f0bb9@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series includes a number of minor improvements, it's a re-send of
patches submitted in December last year already, with minor fixes.

Changes in v3:
* Series is renumbered because original patches 1-4 have been accepted
  already.
* Patch 2 (originally 6): Typo fixed in description.
* Patch 3 (originally 7): Typo fixed in description.
* Patch 4 (originally 8): Reword description, drop stray blank line.

-- 
Jean Delvare
SUSE L3 Support
