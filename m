Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBA724FD9
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 15:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbfEUNLa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 09:11:30 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:53126 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbfEUNL3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 09:11:29 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4LD52Bd011448;
        Tue, 21 May 2019 08:11:06 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sjefmuv88-1;
        Tue, 21 May 2019 08:11:05 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail4.cirrus.com (Postfix) with ESMTP id 8AC20611C8AC;
        Tue, 21 May 2019 08:12:10 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 21 May
 2019 14:11:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 21 May 2019 14:11:04 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E177845;
        Tue, 21 May 2019 14:11:04 +0100 (BST)
Date:   Tue, 21 May 2019 14:11:04 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 3/5] i2c: core: Move ACPI IRQ handling to probe time
Message-ID: <20190521131104.GB99937@ediswmail.ad.cirrus.com>
References: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
 <20190520084936.10590-4-ckeepax@opensource.cirrus.com>
 <20190521112728.GX2781@lahna.fi.intel.com>
 <20190521125704.GF9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190521125704.GF9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=856 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905210083
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 03:57:04PM +0300, Andy Shevchenko wrote:
> On Tue, May 21, 2019 at 02:27:28PM +0300, Mika Westerberg wrote:
> > On Mon, May 20, 2019 at 09:49:34AM +0100, Charles Keepax wrote:
> > > Bring the ACPI path in sync with the device tree path and handle all the
> > > IRQ fetching at probe time. This leaves the only IRQ handling at device
> > > registration time being that which is passed directly through the board
> > > info as either a resource or an actual IRQ number.
> > 
> > I don't see issues with this approach. Cc'd Jarkko and Andy just in case
> > I missed something.
> 
> I failed to see the i2c_acpi_get_irq() in the current code.
> What kernel version do you use?
> Can we see the changes against vanilla / i2c-next?
> 

It's added by the first patch in the chain:

https://lkml.org/lkml/2019/5/20/281

I could resend the series with you and Jarkko on CC if that would
be better.

Thanks,
Charles
