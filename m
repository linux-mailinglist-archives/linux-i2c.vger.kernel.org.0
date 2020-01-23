Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8ABD1464FE
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 10:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgAWJwt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 04:52:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:56638 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgAWJws (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 04:52:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BE1B6AD8E;
        Thu, 23 Jan 2020 09:52:47 +0000 (UTC)
Date:   Thu, 23 Jan 2020 10:52:46 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Lei YU <mine260309@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH 0/2] Move the SMBus API documentation to libi2c
Message-ID: <20200123105246.67732e33@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a cross-project patch set moving the SMBus-level API
documentation from the kernel to libi2c.

[1/2] libi2c: Add a manual page to document the API
[2/2] docs: i2c: dev-interface: document the actual implementation

It applies on top of Luca's recent patch set which cleans up the whole
i2c documentation. I'll rebase it if needed when Luca sends v2 of his
patch set.

-- 
Jean Delvare
SUSE L3 Support
