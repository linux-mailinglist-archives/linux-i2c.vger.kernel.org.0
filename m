Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B166F3D25EA
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 16:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbhGVN5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 09:57:13 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:59844 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhGVN5M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jul 2021 09:57:12 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 112B91FF13;
        Thu, 22 Jul 2021 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626964667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ANm89vlxM8u3IQfDOrR5M1aasqWCIa+hCNqz0vePcro=;
        b=tI0pJ/vI9SqdEqT2naZQdYv4IM/6TljcegbUmSKaSJjutJsR7NRtu+kaIVKtb//sHzhHJp
        KMuoOa+OyeAoy6KImbUlM2psMmMkFc1Ofmh9Iwmy/gszT4aNJ0RAvOrfbRhf/JGK3FMmEJ
        0Yj/G0LUcZLdYLvHApopnWxGuDLhv1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626964667;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ANm89vlxM8u3IQfDOrR5M1aasqWCIa+hCNqz0vePcro=;
        b=/w523/USjDF0RDrOza3Bo5Yi0x4F4Ss0yHGV5Nrs7PoXxg1gl6MsTP+gsR2vv0kQ0yU0Q0
        VgnzC8TmDd6RP+DA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C83D913C20;
        Thu, 22 Jul 2021 14:37:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id RmXrLbqC+WAGDgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 22 Jul 2021 14:37:46 +0000
Date:   Thu, 22 Jul 2021 16:37:45 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: i2c-tools 4.3 has been released
Message-ID: <20210722163745.7d94e450@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

A new version of i2c-tools was tagged and released today. You can
download i2c-tools 4.3 at the usual place:
https://www.kernel.org/pub/software/utils/i2c-tools/

It includes almost one year worth of fixes and improvements. Changes
are as follows:
  * decode-dimms: Attempt to decode LPDDR3 modules
  * eeprom, eepromer: Removed the tools in favor of eeprog
  * i2cdetect: Sort the bus list by number
  * i2cdump: Add range support to I2C block mode
             Deprecate SMBus block mode
  * i2cget: Add support for I2C block read
            Add support for SMBus block read
  * i2ctransfer: Reverted check for returned length from driver

-- 
Jean Delvare
SUSE L3 Support
