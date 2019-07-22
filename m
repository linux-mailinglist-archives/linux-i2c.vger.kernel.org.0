Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D86707F0
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbfGVRyi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:54:38 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:43001 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfGVRyi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Jul 2019 13:54:38 -0400
X-Greylist: delayed 568 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Jul 2019 13:54:37 EDT
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id 66D123A33C; Mon, 22 Jul 2019 19:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563817504;
        bh=EDCTKGqfq25xAg96R9spTkpwty5sb6JLtbPlWuAPZ7U=;
        h=Date:From:To:Cc:Subject:From;
        b=C7knkpyI3gybcgeVsl9/IhuuBvzN9u2kjq1zIEdyjV3SDRNflqrxkyYyeTn/9BzFG
         pO/IpLLkiX1Mb7nOMewJfKDnHOtTiUGeCghdGGXM2IcyqSXwHtjGfoTkUxq3HdI6li
         nXWXJfS+ImuhTKBZ5mhX4GeUORcJkTsKn/huIFEJ7LhfQFTx4Hoz3avW/W8vcXlSuL
         sOYqhDCIaqESdtYvedk/VJr9LCMZ90/Y1BLmQLQI9XcrgXi4I0XDuY3kltj+4OWPCx
         o8dXaXmcffigSQm38cmtmKz1ZcDElEUAAkbPqyhnbyGtNW0TrkVkda1xt1BSnEds2N
         y7hunrtJCI3HQ==
Date:   Mon, 22 Jul 2019 19:45:04 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-i2c@vger.kernel.org
Subject: iTCO_wdt on Intel NUC
Message-ID: <20190722174504.qwp52opvy6ptyxn6@valentin-vidic.from.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

I'm having trouble getting iTCO_wdt to work on NUC8i5BEH with kernel 4.19.37-5+deb10u1:

# modprobe i2c_i801
[40450.070587] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[40450.070652] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[40450.072919] iTCO_vendor_support: vendor-support=0
[40450.073485] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[40450.073546] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
[40450.073578] iTCO_wdt: probe of iTCO_wdt failed with error -16

Is there a way to check if the TCO hardware is missing in this machine
or something else needs to be updated to get it working?

Valentin
