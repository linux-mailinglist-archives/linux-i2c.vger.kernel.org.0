Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBF7778449
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 01:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjHJXsL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 19:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjHJXsK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 19:48:10 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8E1273C
        for <linux-i2c@vger.kernel.org>; Thu, 10 Aug 2023 16:48:07 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1341181f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 10 Aug 2023 16:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=githedgehog-com.20221208.gappssmtp.com; s=20221208; t=1691711285; x=1692316085;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fOEmoyksTV/ogkaNWGnPTAgjYAQOIaH/shH2OEa46IY=;
        b=VWXbOPKFDPnkPsBQWFnRLgw/iKnjwDwPrqlufdM8YZ4ncsoS1XrvJ/25TDnwOzUiUc
         tVXqMjJ2MwVYvBGzCHIZpTIj9Uv/XS/z/DJgNh/lHG5b2SVcxzFHKGSj/utp/PgF3IPJ
         /cznlCj+m78t6Yi65HiVmU2daDM6W6VdiCKUkyJIioyKB72TyRs/DTWvvJVCF1FfGqMT
         cMHhpvoSGNbkiWs8iWuy4itX7ZI8CH1zeFpHCQpF4vfe28fKhN7HEcVdNnGC5IYJrPPA
         r5fpToU2yBR03saR2oOcdufqIua/sOJPfvxr8mq2jyBQrp2ZGtQyoE9ovMGivoPofk12
         DFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691711285; x=1692316085;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOEmoyksTV/ogkaNWGnPTAgjYAQOIaH/shH2OEa46IY=;
        b=GcV19u5FWZlhZ731IZhhFH907FtNf4ytr2cy0NW66yZNUl9a1uoCwO+pWhBPu7Paep
         7PT/2q9aVxzet0koTTtV/XV3Ad6/zO7BmHgSLh+jE2Y0DidV4pFwiHAxq+jU6HSzUYo4
         lLCucpXsuM7Z2A1yFzwh31BJQk3EsgLAsQvQrY5xehMJ0RIriXV4MVt7KyNw4XIY2PUn
         lQ5u6l3HzJI4gGGYUIp7L6rfCC0GvWC57dkanPyTcr7EC37Qz5PzvF9L8GG0d/TB/uOH
         HCAPBs91ST3M9KjpkTSrCvJ8tjhxC+G/IM1DBE7HvvPi0nW+6F6spkFiJdAmWJpma82f
         rE/A==
X-Gm-Message-State: AOJu0Yz8OUYmzg81NiE9qIU/YVYzKsySjt3xlxv5Ob/fSbzxkSdUdbJe
        u3nmJlvcvZ/V76Crk7crzAkZdxVAcSdC72DFb4LnRsC40tokDjvzSOA=
X-Google-Smtp-Source: AGHT+IHdpJ1tlYXh058cpPIXxvERZOK+piwFY8Ux4ySiVbPbwnc7bb9K8NuZrI5udmyxc/2LU2wUmBDd7FCB5RvG+zo=
X-Received: by 2002:a05:6000:511:b0:317:648c:3895 with SMTP id
 a17-20020a056000051100b00317648c3895mr80657wrf.33.1691711285631; Thu, 10 Aug
 2023 16:48:05 -0700 (PDT)
MIME-Version: 1.0
From:   Marcus Heese <marcus@githedgehog.com>
Date:   Thu, 10 Aug 2023 16:47:55 -0700
Message-ID: <CANAYhFWOLiC32wkny_ebBAPJfJxYJD+vu5z5J9cfjQVh6Yzt=A@mail.gmail.com>
Subject: i801: async probe causing problems on Dell S52xxF-ON switches
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

I am trying to gain access to the EEPROM of a Dell S5212F-ON switch
running a vanilla 6.1.44 kernel.
The EEPROM is accessed over SMBus on an i801 bus over PCI at "00:1f.4
Class 0c05: 8086:19df i801_smbus".

The environment that I'm working under is ONIE
(https://github.com/opencomputeproject/onie), and the userspace tools
that I'm using to test the access are:
- onie-syseeprom: reads the EEPROM by essentially using a combination
of 'i2c_smbus_write_byte()' and 'i2c_smbus_read_byte()' commands
- i2cdump -y 1 0x50: reads the EEPROM by using
'i2c_smbus_read_byte_data()' commands

Using the i2cdump utility read the EEPROM, but produced garbage
output. However, the garbage data was consistent all the time - even
after reboots.
Using the onie-syseeprom tool failed on the ioctl for the
i2c_smbus_write_byte with ENXIO - in fact all writes always failed
like this.
It is also worth mentioning that there are no errors, warnings or
crashes/traces in the dmesg output of the running kernel. In fact, the
info messages for the i801_smbus look all correct to me and are
exactly the same of confirmed working kernels:

[    2.514373] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[    2.514594] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.514649] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt

After a long (and painful) exercise of compiling myself up from a
confirmed working 4.9 kernel, I realized that the problem must have
been introduced between kernels 6.0 and 6.1.
Reverting the "i2c: i801: Prefer async probe" commit
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=342530f7fe1ada578452c4daa2c9b5902cedf480)
fixed the problem, and my userspace tools started working again as
expected.

Looking at the commit I do not really believe that this should have
that drastic of an impact, and that reverting this commit is probably
only hiding the underlying real problem.
My current semi-educated guess/working theory is that the probing
probably never finished when in async mode or something went wrong
when doing an async probe?

I'm assuming that reverting this commit is definitely not feasible as
I seem to be the first person to run into this issue, and I also
believe that there is probably a hidden problem.

How can I debug this further? Any help is much appreciated.

---
Marcus Heese
Linux Platform Engineer
Hedgehog SONiC Foundation
