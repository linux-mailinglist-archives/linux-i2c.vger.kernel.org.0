Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B86643587F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 10:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfFEI1K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 04:27:10 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:36254 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726554AbfFEI1K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 04:27:10 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x558K72n001312;
        Wed, 5 Jun 2019 03:26:42 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0a-001ae601.pphosted.com with ESMTP id 2sups14mts-1;
        Wed, 05 Jun 2019 03:26:42 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail4.cirrus.com (Postfix) with ESMTP id 70223611C8AC;
        Wed,  5 Jun 2019 03:27:13 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 5 Jun
 2019 09:26:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 5 Jun 2019 09:26:41 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3A87C2A1;
        Wed,  5 Jun 2019 09:26:41 +0100 (BST)
Date:   Wed, 5 Jun 2019 09:26:41 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 2/6] i2c: acpi: Use available IRQ helper functions
Message-ID: <20190605082641.GM28362@ediswmail.ad.cirrus.com>
References: <20190528142900.24147-1-ckeepax@opensource.cirrus.com>
 <20190528142900.24147-2-ckeepax@opensource.cirrus.com>
 <20190604170052.GQ9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190604170052.GQ9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=886 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906050054
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 04, 2019 at 08:00:52PM +0300, Andy Shevchenko wrote:
> On Tue, May 28, 2019 at 03:28:56PM +0100, Charles Keepax wrote:
> > Use the available IRQ helper functions, most of the functions have
> > additional helpful side affects like configuring the trigger type of the
> > IRQ.
> > 
> 
> You do here two things, i.e.
> - splitting out helper function
> - converting it to use helpers
> 
> I would split the patch to do exact these steps separately, e.g.:
> - splitting out to a local helper
> - replacing open coded stuff with existing helpers
> 

This can't really be done like this, the helper is called by
acpi_dev_get_resources and I need the acpi_resource from that to
call acpi_dev_resource_interrupt. I guess I could do a separate
patch to start using i2c_dev_irq_from_resource if that would be
preferrable? But I think the rest needs to stay together.

Thanks,
Charles
