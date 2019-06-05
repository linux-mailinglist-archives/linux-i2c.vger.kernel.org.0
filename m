Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A1035873
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 10:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfFEIX1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 04:23:27 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:58506 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725294AbfFEIX1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 04:23:27 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x558JvZW018984;
        Wed, 5 Jun 2019 03:22:51 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sunsrckqj-1;
        Wed, 05 Jun 2019 03:22:51 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail2.cirrus.com (Postfix) with ESMTP id 93DFA605A68C;
        Wed,  5 Jun 2019 03:22:50 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 5 Jun
 2019 09:22:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 5 Jun 2019 09:22:50 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E1B602DA;
        Wed,  5 Jun 2019 09:22:49 +0100 (BST)
Date:   Wed, 5 Jun 2019 09:22:49 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 4/6] i2c: core: Move ACPI IRQ handling to probe time
Message-ID: <20190605082249.GL28362@ediswmail.ad.cirrus.com>
References: <20190528142900.24147-1-ckeepax@opensource.cirrus.com>
 <20190528142900.24147-4-ckeepax@opensource.cirrus.com>
 <20190604170404.GR9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190604170404.GR9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=902 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906050054
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 04, 2019 at 08:04:04PM +0300, Andy Shevchenko wrote:
> On Tue, May 28, 2019 at 03:28:58PM +0100, Charles Keepax wrote:
> > Bring the ACPI path in sync with the device tree path and handle all the
> > IRQ fetching at probe time. This leaves the only IRQ handling at device
> > registration time being that which is passed directly through the board
> > info as either a resource or an actual IRQ number.
> > 
> 
> It seems my comments weren't addressed by one or another reason.
> This one I would rather to split with exporting function as a separate patch.
> 

With the switch to passing in i2c_client it makes for some fairly
awkward gymnastics and "ping pong" programming to do so. I guess
we could leave the function taking in an acpi_device but just
felt like a slightly less user friendly interface. Any thoughts?

Thanks,
Charles
