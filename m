Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A87AD2C534
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 13:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfE1LOX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 07:14:23 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:44280 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbfE1LOX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 07:14:23 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4SB9FKR016551;
        Tue, 28 May 2019 06:13:10 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2sq340k99g-1;
        Tue, 28 May 2019 06:13:10 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id 8C146611C8C0;
        Tue, 28 May 2019 06:13:09 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 28 May
 2019 12:13:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 28 May 2019 12:13:08 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D534745;
        Tue, 28 May 2019 12:13:08 +0100 (BST)
Date:   Tue, 28 May 2019 12:13:08 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <wsa@the-dreams.de>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/6] i2c: acpi: Use available IRQ helper functions
Message-ID: <20190528111308.GF28362@ediswmail.ad.cirrus.com>
References: <20190527151932.14310-1-ckeepax@opensource.cirrus.com>
 <20190527151932.14310-2-ckeepax@opensource.cirrus.com>
 <20190528103028.GA2781@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190528103028.GA2781@lahna.fi.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=889 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905280073
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 28, 2019 at 01:30:28PM +0300, Mika Westerberg wrote:
> On Mon, May 27, 2019 at 04:19:28PM +0100, Charles Keepax wrote:
> >  static int i2c_acpi_get_info(struct acpi_device *adev,
> >  			     struct i2c_board_info *info,
> >  			     struct i2c_adapter *adapter,
> >  			     acpi_handle *adapter_handle)
> >  {
> >  	struct list_head resource_list;
> > -	struct resource_entry *entry;
> >  	struct i2c_acpi_lookup lookup;
> > +	int irq = -ENOENT;
> >  	int ret;
> >  
> >  	memset(&lookup, 0, sizeof(lookup));
> > @@ -176,16 +187,13 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
> >  
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
> > +	if (irq >= 0)
> 
> Since 0 is not valid IRQ, I think this should be written like:
> 
> 	if (irg > 0)
> 

Yeah sorry thought IRQs were like GPIOs where 0 is a valid
number, will update the patches.

Thanks,
Charles
> > +		info->irq = irq;
> >  
> >  	acpi_dev_free_resource_list(&resource_list);
> >  
> > -- 
> > 2.11.0
