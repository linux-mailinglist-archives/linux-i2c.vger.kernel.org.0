Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 980804D1C1
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 17:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfFTPLz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 11:11:55 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:4574 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726512AbfFTPLz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 11:11:55 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KFAHuE008756;
        Thu, 20 Jun 2019 10:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ln7dkvArTMvPCZI/teQNxY7fYIBJQ2+O3y36iVfwwhU=;
 b=VDxqVuUIdo+iIzaT7zCSpDT1zuA5PDq2PIx/jYFvgU19t+niTOfjmfGHzGUwW1eriSQ2
 6zPpE9ckHy7HugMHyoKWUU2QrIPjly1amfQDc6uKeMQSz4UMcYJ1RjPhWl6hKtuMzozF
 QfHGQp9ac8zUrzpRnM5Ymer+SlWEwXdFDH0wENa4pfW22BEoxqo+r/qNZbzvEXvJ6itt
 e7OBgTUp4nkjqtdnslbL1hN61LlfBzfA7ySEjOf4OZlZ0LKFCdydh4PZPZD9wC5tZX0z
 DUcjgSyVeAnDxJeGXazZc+Bl0B9MGkytFrrdapOY1ytMj40U0TEKyN5EcI8LULkyLlGo 3A== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t780ctnwk-1;
        Thu, 20 Jun 2019 10:11:17 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail3.cirrus.com (Postfix) with ESMTP id 4773E615D9D0;
        Thu, 20 Jun 2019 10:12:03 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 16:11:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 16:11:15 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9A9944;
        Thu, 20 Jun 2019 16:11:15 +0100 (BST)
Date:   Thu, 20 Jun 2019 16:11:15 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>,
        <jarkko.nikula@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v5 2/7] i2c: acpi: Use available IRQ helper functions
Message-ID: <20190620151115.GA54126@ediswmail.ad.cirrus.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
 <20190620133420.4632-3-ckeepax@opensource.cirrus.com>
 <20190620145221.GC9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190620145221.GC9224@smile.fi.intel.com>
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

On Thu, Jun 20, 2019 at 05:52:21PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 20, 2019 at 02:34:15PM +0100, Charles Keepax wrote:
> > Use the available IRQ helper functions, most of the functions have
> > additional helpful side affects like configuring the trigger type of the
> > IRQ.
> > 
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Some last minute observations / questions.
> 
> > +	struct resource r;
> > +
> > +	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
> > +		*irq = i2c_dev_irq_from_resources(&r, 1);
> > +
> > +	return 1; /* No need to add resource to the list */
> 
> If we don't add it to the list, do we still need to manage the empty
> resource_list below?
> 

I think you are right looking closely I think we can skip this. I
might update the comment here to make it clear the list needs
freed if this is changed though.

> >  	/* Then fill IRQ number if any */
> >  	INIT_LIST_HEAD(&resource_list);
> > -	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
> > +	ret = acpi_dev_get_resources(adev, &resource_list,
> > +				     i2c_acpi_add_resource, &irq);
> >  	if (ret < 0)
> >  		return -EINVAL;
> >  
> > -	resource_list_for_each_entry(entry, &resource_list) {
> > -		if (resource_type(entry->res) == IORESOURCE_IRQ) {
> > -			info->irq = entry->res->start;
> > -			break;
> > -		}
> > -	}
> 
> > +	if (irq > 0)
> > +		info->irq = irq;
> 
> Hmm... can't we just assign it directly inside the _add_resource() call back as
> original code did?
> 

Again I think you are correct here, my thinking had been to
preserve the original functionality of only overwriting the value
in info->irq if we found one. But it looks like all callers don't
pass anything meaningful in this field so changing that behaviour
shouldn't matter.

Thanks,
Charles
