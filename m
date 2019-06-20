Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1732C4D1CA
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 17:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfFTPP3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 11:15:29 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:57442 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726512AbfFTPP2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 11:15:28 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KFAETQ008735;
        Thu, 20 Jun 2019 10:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=9VYaOdEDt/Ppw9q+XoYjEoDW5NIi5eVOJ0dRdfOiirk=;
 b=rHV7h7aLsM+z0WkIl+O6o+TM9hH8B/s+EhrlCMFa2s1JvL+w8mC9mCXUPn+dbg/Vv+j1
 KHNmV8NTfA912mqsH1v/xHWLe3gW8N1zDFnag1Gu+JMuiyZvbkpdYo9V7mSl/Gc1YHIV
 85DBTC90QQNqxi5yLQIWEyuV4RKELnEXavfmD3a6m2q1KYrtBu04dV8l/4CgeCpMBVHT
 yHFofYb1Eg+BlioFnQRLTXPWu9RUD0FPg/qZ0e07H3q2xR6GXv/EsnmtOfPj8PGlUDqQ
 TgOwj0wAnLN328HGqzf5oXpzBBZ1p7PGIYYMTDlFb5IwESW9uOGyOIoDEf0MoWyIXL4/ EA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t780ctnyx-1;
        Thu, 20 Jun 2019 10:12:51 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id A1235611C8BF;
        Thu, 20 Jun 2019 10:12:50 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 16:12:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 16:12:49 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 311D645;
        Thu, 20 Jun 2019 16:12:50 +0100 (BST)
Date:   Thu, 20 Jun 2019 16:12:50 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v5 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190620151250.GB54126@ediswmail.ad.cirrus.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
 <20190620133420.4632-5-ckeepax@opensource.cirrus.com>
 <20190620145950.GE9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190620145950.GE9224@smile.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200111
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 20, 2019 at 05:59:50PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 20, 2019 at 02:34:17PM +0100, Charles Keepax wrote:
> > In preparation for more refactoring make i2c_acpi_get_irq available
> > outside i2c-core-acpi.c.
> 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> I'm not sure Rb tags are suitable for patches 4 and 5 since the changes made.
> 

Apologies I figured the changes were small enough will remove for
any changes in future.

> > +struct acpi_device;
> 
> Hmm... Doesn't acpi.h define that for !ACPI case?
> 

Pretty sure I was getting a build error in that case.

> >  #ifdef CONFIG_ACPI
> >  const struct acpi_device_id *
> >  i2c_acpi_match_device(const struct acpi_device_id *matches,
> >  		      struct i2c_client *client);
> >  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> > +
> > +int i2c_acpi_get_irq(struct acpi_device *adev);
> 
> Since you call this afterwards with struct device from which companion is
> derived, can't we directly use struct device as a parameter?
> 
> Yes, in case of adev call, it might be &adev->dev I suppose?
> 

A good idea I will investigate and do a respin taking in the
other comments too.

Thanks,
Charles
