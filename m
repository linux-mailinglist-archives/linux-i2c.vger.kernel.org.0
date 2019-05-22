Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C3E25F52
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 10:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfEVITr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 04:19:47 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:49134 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728600AbfEVITq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 04:19:46 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4M8EmX0019931;
        Wed, 22 May 2019 03:19:07 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sjefmw4u6-1;
        Wed, 22 May 2019 03:19:06 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 46BD2605A6A3;
        Wed, 22 May 2019 03:19:06 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 22 May
 2019 09:19:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 22 May 2019 09:19:05 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9917245;
        Wed, 22 May 2019 09:19:05 +0100 (BST)
Date:   Wed, 22 May 2019 09:19:05 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH 4/5] i2c: core: Move ACPI gpio IRQ handling into
 i2c_acpi_get_irq
Message-ID: <20190522081905.GC99937@ediswmail.ad.cirrus.com>
References: <20190521150502.27305-1-ckeepax@opensource.cirrus.com>
 <20190521150502.27305-5-ckeepax@opensource.cirrus.com>
 <20190521172726.GO9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190521172726.GO9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=952 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905220061
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 08:27:26PM +0300, Andy Shevchenko wrote:
> On Tue, May 21, 2019 at 04:05:01PM +0100, Charles Keepax wrote:
> > It makes sense to contain all the ACPI IRQ handling in a single helper
> > function.
> 
> > Note that this one is somewhat interesting, it seems the search
> > through the resource list is done against the companion device
> > of the adapter but the GPIO search is done against the companion
> > device of the client. It feels to me like these really should
> > be done on the same device, and certainly this is what SPI
> > does (both against the equivalent of the adapter). Perhaps
> > someone with more ACPI knowledge than myself could comment?
> 
> It would be interesting to see the path how you come to this conclusion.
> 

Apologies but I am not sure which conclusion you are referencing.
Assuming it is them being called with different acpi_device's.
It is perhaps me misunderstanding things but it looks like
i2c_acpi_get_info implies the adev should correspond to the
adapter. Where as acpi_dev_gpio_irq_get is called with the result
of ACPI_COMPANION(dev) where dev is client->dev.

> >  	acpi_dev_free_resource_list(&resource_list);
> >  
> > +	if (*irq < 0)
> > +		*irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
> 
> I think adev here is what we may use here.
> 

Indeed that is what I would have expected as well, I will update
the code to do so and hopefully any issues will come out in
testing.

> You may put assert here and see if it happens when you test your series.
> 

Alas I don't have a good way to test this series, they come out
of some additional work Wolfram wanted based on some issues
caused by a device tree fix I made a while back.

Thanks,
Charles
