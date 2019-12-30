Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B82A112CD26
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2019 07:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfL3GDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Dec 2019 01:03:04 -0500
Received: from vuizook.err.no ([178.255.151.162]:60962 "EHLO vuizook.err.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727115AbfL3GDE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Dec 2019 01:03:04 -0500
X-Greylist: delayed 998 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Dec 2019 01:03:03 EST
Received: from p576124-ipngn200707tokaisakaetozai.aichi.ocn.ne.jp ([122.31.139.124] helo=glandium.org)
        by vuizook.err.no with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mh@glandium.org>)
        id 1ilnsl-0003LE-7D; Mon, 30 Dec 2019 05:46:23 +0000
Received: from glandium by goemon.lan with local (Exim 4.92)
        (envelope-from <mh@glandium.org>)
        id 1ilnsi-000LHA-KC; Mon, 30 Dec 2019 14:46:20 +0900
Date:   Mon, 30 Dec 2019 14:46:20 +0900
From:   Mike Hommey <mh@glandium.org>
To:     linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: I2C/SMBus support for Threadripper 39x0X?
Message-ID: <20191230054620.lesgynpyghprzmsh@glandium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GPG-Fingerprint: 182E 161D 1130 B9FC CD7D  B167 E42A A04F A6AA 8C72
User-Agent: NeoMutt/20180716
X-Spam-Status: (score 0.9): No, score=0.9 required=5.0 tests=SPF_FAIL,SPF_HELO_FAIL autolearn=disabled version=3.4.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I recently built a machine with a Threadripper 3970X and a Gigabyte
TRX40 Aorus pro wifi, and while it works for most of everything with
5.5 rc3 or rc4, I do have an issue with SMBus support, which I was
supposing is why I'm not seeing any readings for e.g. CPU fans with
lm-sensors.

The i2c-piix4 driver loads, but does nothing, leaving this message in
dmesg:

[    2.711213] ACPI Warning: SystemIO range 0x0000000000000B00-0x0000000000000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\GSA1.SMBI) (20191018/utaddress-213)
[    2.711218] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver

Instrumenting the module, I can see it comes from
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-piix4.c?id=fd6988496e79a6a4bdb514a4655d2920209eb85d#n323

If I remove the check, the module loads and dmesg says:

[ 7589.210039] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[ 7589.210041] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection

and now i2cdetect -l does find the smbus adapter, which it didn't find
before the change.

i2c-6   smbus           SMBus PIIX4 adapter port 2 at 0b00      SMBus adapter
i2c-5   smbus           SMBus PIIX4 adapter port 0 at 0b00      SMBus adapter

sensors-detect doesn't find any sensors in there, though (only SPD
EEPROMs), so that may not be where my missing sensors are.

In any case, the SMBus adapter is currently not initialized without tweaking the
module.

I should add, though, that during boot, I see a bunch of these in dmesg:

[    0.388399] ACPI BIOS Error (bug): Failure creating named object [\_SB.I2CA.WT1A], AE_ALREADY_EXISTS (20191018/dswload2-324)
[    0.388405] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20191018/psobject-221)
[    0.388407] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.388408] ACPI BIOS Error (bug): Failure creating named object [\_SB.I2CA.MT1A], AE_ALREADY_EXISTS (20191018/dswload2-324)
[    0.388411] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20191018/psobject-221)
[    0.388412] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
(and many more similar ones)

I don't know if they'd be related, but dumping the ACPI tables, it looks
like there are "only" duplicates between the DSDT and one of the SSDT
tables.

Cheers,

Mike
