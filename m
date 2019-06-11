Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 338FD3D0C6
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 17:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404414AbfFKP3E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 11:29:04 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:36414 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387864AbfFKP3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 11:29:04 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5BFNeLu029871;
        Tue, 11 Jun 2019 10:28:34 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t0ae2vet2-1;
        Tue, 11 Jun 2019 10:28:34 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail4.cirrus.com (Postfix) with ESMTP id 2AABD611C8A7;
        Tue, 11 Jun 2019 10:28:51 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 11 Jun
 2019 16:28:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 11 Jun 2019 16:28:33 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2704B44;
        Tue, 11 Jun 2019 16:28:33 +0100 (BST)
Date:   Tue, 11 Jun 2019 16:28:33 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Jim Broadus <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/7] I2C IRQ Probe Improvements
Message-ID: <20190611152833.GR28362@ediswmail.ad.cirrus.com>
References: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
 <CAO-hwJ+qSXwZ-5sAiZ55-r_PXp9pvnE1XEaE_v3SBnxzQQNH4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+qSXwZ-5sAiZ55-r_PXp9pvnE1XEaE_v3SBnxzQQNH4g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110101
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 11, 2019 at 05:16:58PM +0200, Benjamin Tissoires wrote:
> On Tue, Jun 11, 2019 at 2:31 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > This series attempts to align as much IRQ handling into the
> > probe path as possible. Note that I don't have a great setup
> > for testing these patches so they are mostly just build tested
> > and need careful review and testing before any of them are
> > merged.
> >
> > The series brings the ACPI path inline with the way the device
> > tree path handles the IRQ entirely at probe time. However,
> > it still leaves any IRQ specified through the board_info as
> > being handled at device time. In that case we need to cache
> > something from the board_info until probe time, which leaves
> > any alternative solution with something basically the same as
> > the current handling although perhaps caching more stuff.
> 
> Hmm, I still haven't pinpointed the issue, but I wanted to give a test
> of the series and I have:
> [    5.511806] i2c_hid i2c-DLL075B:01: HID over i2c has not been
> provided an Int IRQ
> [    5.511825] i2c_hid: probe of i2c-DLL075B:01 failed with error -22
> 
> So it seems that there is something wrong happening when fetching the
> IRQ and providing it to i2c-hid.
> 
> That was on a Dell XPS 9360.
> 
> Bisecting is starting.
> 

I have a sneaking suspision, does this diff fix it:

diff --git a/drivers/i2c/i2c-core-acpi.c
b/drivers/i2c/i2c-core-acpi.c
index 57be6342ba508..a90b05a269c36 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -169,7 +169,7 @@ int i2c_acpi_get_irq(struct i2c_client *client)
        acpi_dev_free_resource_list(&resource_list);

        if (irq == -ENOENT)
-           irq = acpi_dev_gpio_irq_get(adev, 0);
+         irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);

        return irq;
 }

There was some earlier discussion about which device was suitable
for this call.

Thanks,
Charles
