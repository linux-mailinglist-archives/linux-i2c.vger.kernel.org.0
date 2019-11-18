Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E377A100132
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 10:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfKRJYN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 04:24:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:56052 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726460AbfKRJYM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Nov 2019 04:24:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A9CE6B196;
        Mon, 18 Nov 2019 09:24:11 +0000 (UTC)
Date:   Mon, 18 Nov 2019 10:24:10 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 0/4 v2] Instantiate SPD EEPROMs at boot on x86
Message-ID: <20191118102410.78cd8e6e@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is my work to let decode-dimms work out of the box on most x86
desktop and laptop systems.

[PATCH 1/4] firmware: dmi: Remember the memory type
[PATCH 2/4] firmware: dmi: Add dmi_memdev_handle
[PATCH 3/4] i2c: smbus: Add a way to instantiate SPD EEPROMs automatically
[PATCH 4/4] i2c: i801: Instantiate SPD EEPROMs automatically

Changes since v1:
 * Fix build warning and error reported by kbuild test bot for specific
   kernel configurations

-- 
Jean Delvare
SUSE L3 Support
