Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED1957E17
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 10:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfF0ITC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 04:19:02 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:38748 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726375AbfF0ITC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 04:19:02 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5R8EWH3001077;
        Thu, 27 Jun 2019 03:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=SPMSdJWUdq28cBBokDIr/2PnNB0Q1pKbztAnSEHceO8=;
 b=e3m2MG4RIvL7IAJHAnWX867w01y82a5PoyXHRMlVdhxf3zBazZvlJ+k5Y3GZjSGSKL+7
 +D2vZzMNLQZUhRpk6CQw17jaevyKtq+BCpm2yozrxqES2VAwblsJiDlMYu0k9Wpzfz+1
 O4L7SuJDtte5YcpfTLsz1byhet/A6VOKTTL6XVPS2As3TZmC7Q8PkzhIHkW7VngeRQ3n
 PsVVQqifXLqPi6AUJGtIlknZ2YEZfu8PPdyCmkI4JzwZk7v6qOQI3gVbEDoMRQLmLZa9
 TgX//CmjU4RuKKilMZ3uhgi/bOVZGyW7yXNrGDO5MAyJh6MBKxHXFR9n3QVa9wOSV9Cd rQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2gnb7-1;
        Thu, 27 Jun 2019 03:18:32 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 169CC605A6A7;
        Thu, 27 Jun 2019 03:18:32 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 09:18:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 27 Jun 2019 09:18:31 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6715C45;
        Thu, 27 Jun 2019 09:18:31 +0100 (BST)
Date:   Thu, 27 Jun 2019 09:18:31 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v7 2/6] i2c: acpi: Use available IRQ helper functions
Message-ID: <20190627081831.GF54126@ediswmail.ad.cirrus.com>
References: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
 <20190626150302.22703-3-ckeepax@opensource.cirrus.com>
 <20190626190906.GA9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190626190906.GA9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=696 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270096
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 26, 2019 at 10:09:06PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 26, 2019 at 04:02:58PM +0100, Charles Keepax wrote:
> > Use the available IRQ helper functions, most of the functions have
> > additional helpful side affects like configuring the trigger type of the
> > IRQ.
> 
> > -	acpi_dev_free_resource_list(&resource_list);
> 
> I have thought that we can drop completely the resource_list, though ACPI
> doesn't allow this. So, I would rather withdraw this change to be on the safe
> (symmetrical) side.
> 

Yeah would be my preference as well, will do another spin.

Thanks,
Charles
