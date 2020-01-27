Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301AF14A37B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 13:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbgA0MGj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 07:06:39 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:45922 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728981AbgA0MGj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 07:06:39 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RBwWka035440;
        Mon, 27 Jan 2020 12:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=aCpiRvcuT1SWusCh3YSBSKuWGL7xUj4sNNEyF3C+GSc=;
 b=dQW1ulFpPNxI1R48GdMIaGJz6BAQRc71iwu4zWxezUnY6OsrBJuxWxNnZQW0KejlXfkg
 ucwB3oon3CYcBcd9ML8VbSfHDSZwe643lqZh3nYYzKmUqy0rTHhiCdOUWZ1Q6q8v721z
 lntBkuupp0ajIMZ/ws6rU89g0CiwQokRaSwpIDp5ZZIM6q1QSZj4tUuPHIEQCCTTgG5/
 5OhKxQ/CTd6WxsugkdJyQghKRdUGlTI/rwoc6VM9uKS/kHOtwmT+sIuSzvu2t1UNiCJh
 BWAdNo7m9f8f5O3qL8rPXm5GBdabd32crjNib/v/cqHjjHtQRl13WJ+zN3mtK/8qArCN 2g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2xrd3txxck-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jan 2020 12:06:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RBwIqV098559;
        Mon, 27 Jan 2020 12:06:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2xry4u7p22-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jan 2020 12:06:26 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00RC6Pmt000832;
        Mon, 27 Jan 2020 12:06:25 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jan 2020 04:06:24 -0800
Date:   Mon, 27 Jan 2020 15:05:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Colin King <colin.king@canonical.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
Message-ID: <20200127120535.GC1847@kadam>
References: <20200127102303.44133-1-colin.king@canonical.com>
 <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9512 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9512 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270103
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 27, 2020 at 12:03:02PM +0100, Michal Simek wrote:
> On 27. 01. 20 11:23, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a statement that is indented one level too deeply, remove
> > the extraneous tab.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> > V2: fix type in commit message
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index b17d30c9ab40..90c1c362394d 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -261,7 +261,7 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
> >  		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
> >  		if (time_after(jiffies, timeout)) {
> >  			dev_err(i2c->dev, "Failed to clear rx fifo\n");
> > -				return -ETIMEDOUT;
> > +			return -ETIMEDOUT;
> >  		}
> >  	}
> >  
> > 
> 
> As was suggested by Peter you should also add Fixes: <sha1> ("patch
> subject")
> 

It's not really a bugfix, it's just a cleanup.

regards,
dan carpenter

