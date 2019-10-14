Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77755D5F0B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 11:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbfJNJgW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 05:36:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:54468 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730667AbfJNJgW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 05:36:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5221DBD2E;
        Mon, 14 Oct 2019 09:36:21 +0000 (UTC)
Date:   Mon, 14 Oct 2019 11:36:36 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 0/4] Instantiate SPD EEPROMs at boot on x86
Message-ID: <20191014113636.57b5ce89@endymion>
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

-- 
Jean Delvare
SUSE L3 Support
