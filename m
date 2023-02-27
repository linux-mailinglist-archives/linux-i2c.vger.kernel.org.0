Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4556A4442
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 15:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjB0OXS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 09:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjB0OXR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 09:23:17 -0500
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5824FDBF8;
        Mon, 27 Feb 2023 06:23:15 -0800 (PST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id D1ECF61CC40F9;
        Mon, 27 Feb 2023 15:23:13 +0100 (CET)
Message-ID: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
Date:   Mon, 27 Feb 2023 15:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Dell.Client.Kernel@dell.com,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Accelerometer lis3lv02d is present on SMBus but its address is
 unknown, skipping registration
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Linux folks,


On the Dell Precision 3540, BIOS 1.23.0 12/19/2022, with Debian 
sid/unstable, Linux 6.1.12 logs the warning below:

     Accelerometer lis3lv02d is present on SMBus but its address is 
unknown, skipping registration

This warning was already logged by

     Linux version 5.19.0-2-amd64 (debian-kernel@lists.debian.org) 
(gcc-11 (Debian 11.3.0-6) 11.3.0, GNU ld (GNU Binutils for Debian) 
2.38.90.20220713) #1 SMP PREEMPT_DYNAMIC Debian 5.19.11-1 (2022-09-24)

with firmware BIOS 1.15.0 12/08/2021.

What can a user do about this? It looks like the I2C addresses need to 
be added to `dell_lis3lv02d_devices[]` in `drivers/i2c/busses/i2c-i801.c`.


Kind regards,

Paul


PS: Some more logs:

```
[    0.000000] Linux version 6.1.0-5-amd64 
(debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-14) 12.2.0, GNU 
ld (GNU Binutils for Debian) 2.40) #1 SMP PREEMPT_DYNAMIC Debian 
6.1.12-1 (2023-02-15)
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.1.0-5-amd64 
root=UUID=c9342a55-b747-4442-b2f4-bc03eb7a51cf ro quiet noisapnp 
log_buf_len=2M cryptomgr.notests btusb.enable_autosuspend=y 
random.trust_cpu=on drm.debug=0xe log_buf_len=8M
[…]
[    0.000000] DMI: Dell Inc. Precision 3540/0M14W7, BIOS 1.23.0 12/19/2022
[…]
[   20.631866] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   20.631925] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   20.662022] i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is 
present on SMBus but its address is unknown, skipping registration
[…]
```
