Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0EF4A64E6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfICJRd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:17:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:48192 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726631AbfICJRc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:17:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 77A63B793
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:17:31 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:17:06 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 0/7] i2c-tools: Various fixes and improvements to
 decode-dimms
Message-ID: <20190903111706.43f9bc2b@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[PATCH 1/7] decode-dimms: Detect and report truncated input files
[PATCH 2/7] decode-dimms: Print kernel driver used
[PATCH 3/7] decode-dimms: Print DDR memory speed in MT/s not MHz
[PATCH 4/7] decode-dimms: Add DDR5 memory types to the list
[PATCH 5/7] decode-dimms: Decode manufacturing data for LPDDR3
[PATCH 6/7] decode-dimms: Fix the version string
[PATCH 7/7] decode-dimms: Point the user to the right drivers

-- 
Jean Delvare
SUSE L3 Support
