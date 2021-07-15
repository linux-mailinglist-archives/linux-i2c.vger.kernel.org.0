Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0204B3CA05A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 16:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhGOOSR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 10:18:17 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:37628 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbhGOOSQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jul 2021 10:18:16 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E01E322A72;
        Thu, 15 Jul 2021 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626358522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=eqYkoMArbZU/JBUjcMsctLjmY1bXNj/5re+Ez2dl5Bk=;
        b=dz6cJU7de4Q0kR+JNy7WeAAmZjdCR25Ol4NaFl48+JlMTMw2k7loQ5Dg2qmknxCXhrvEHZ
        aSiHR/+xLYRnKns2aNWu0kj+yGG1zVbO4LUXw8msUuzjI6Z0yWAYE1wg/Md+P2drz06u98
        LfAfdzhNCBaHU1/kQlCA03tbdzE6PR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626358522;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=eqYkoMArbZU/JBUjcMsctLjmY1bXNj/5re+Ez2dl5Bk=;
        b=I5fJvls97VYcNz7/BeH8ulxtrrT/dJHQPPj6eVd4+Fx8Cc6LapmGX4oZzXSKW1wEUQ4kw9
        X+6D3idJtkomRvCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98A6113C38;
        Thu, 15 Jul 2021 14:15:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5AZZIvpC8GB7XQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 15 Jul 2021 14:15:22 +0000
Date:   Thu, 15 Jul 2021 16:15:20 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Upcoming release of i2c-tools (will be 4.3)
Message-ID: <20210715161520.3830c3d1@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

Due to a regression in i2c-tools 4.2, we decided to hurry the release
of i2c-tools 4.3 even though there aren't that many changes queued.
Well there are still a few nice new features so the update will be
worth it. Here's what the CHANGES file has to say about what's coming:

  decode-dimms: Attempt to decode LPDDR3 modules
  eeprom, eepromer: Removed the tools in favor of eeprog
  i2cdetect: Sort the bus list by number
  i2cdump: Add range support to I2C block mode
           Deprecate SMBus block mode
  i2cget: Add support for I2C block read
          Add support for SMBus block read
  i2ctransfer: Reverted check for returned length from driver

I will tag and release v4.3 next week. Until then, please give it good
testing if you can, and report any issue.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
