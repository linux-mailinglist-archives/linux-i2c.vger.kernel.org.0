Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0345C37BDBB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 15:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhELNMN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 09:12:13 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50396 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbhELNMN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 09:12:13 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14CDAVxs179711;
        Wed, 12 May 2021 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=dB4umoOY8Gxb4T2odmbzYdmoXU3OUv+za2QtVhheo5M=;
 b=APteIyHSvxOSGayZ3BbNJbItfF9T40Yyuh5Jf9R480gvNy0sxC/sAqrMTIDdtSMhCvnX
 MSBhnt6yF4e7ziGeP09gCLet3Gu8a8Cx/dQQC0H0mFpJQKvI8fZv0sg4FwIIRcFncBcS
 cpaIY0MWakSkhQEZLp4tgAtnT1eTyQUWT3vgmlR4OGpMC/WudMGGGO9nWE1EeMhRuU/m
 TUoVmtKIo5IVp2m4VBLvhw0d+y0PGmx2t0wmE8E39Sl4ol+9gifwADimfObpwXFg0ep3
 tOqbz+4aFBAXWz3mu7+3ZYa4ILfoGX3qT3emsDX9is8pUtkPoA7aEoGeZ1OxD5F5d6Wi IQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 38e285h70y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 13:10:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14CDAjHo009187;
        Wed, 12 May 2021 13:10:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38djfbjqg2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 13:10:55 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14CDAn2V009743;
        Wed, 12 May 2021 13:10:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 38djfbjq9b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 13:10:49 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14CDAeMo029406;
        Wed, 12 May 2021 13:10:41 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 May 2021 06:10:40 -0700
Date:   Wed, 12 May 2021 16:10:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: cp2615: check for allocation failure in
 cp2615_i2c_recv()
Message-ID: <20210512131034.GW1955@kadam>
References: <YJuosd6rew91vlyX@mwanda>
 <CACCVKEEQViw1FaSA4dZoy3KbZydxDyxdx+uf=zQW1Q=R5kRAcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACCVKEEQViw1FaSA4dZoy3KbZydxDyxdx+uf=zQW1Q=R5kRAcg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: YgFe_44f5Nw9ZgUkblFucR3izHaX5eus
X-Proofpoint-ORIG-GUID: YgFe_44f5Nw9ZgUkblFucR3izHaX5eus
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9981 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 12, 2021 at 12:54:47PM +0200, Bence Csókás wrote:
> Dan Carpenter <dan.carpenter@oracle.com> ezt írta (időpont: 2021. máj.
> 12., Sze, 12:07):
> >
> > We need to add a check for if the kzalloc() fails.
> 
> That is correct, I missed that :/
> 
> >
> > Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/i2c/busses/i2c-cp2615.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> > index 78cfecd1ea76..3ded28632e4c 100644
> > --- a/drivers/i2c/busses/i2c-cp2615.c
> > +++ b/drivers/i2c/busses/i2c-cp2615.c
> > @@ -138,17 +138,23 @@ cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
> >  static int
> >  cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
> >  {
> > -       struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> > -       struct cp2615_i2c_transfer_result *i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;
> 
> These two lines could stay as-is, since the invalid i2c_r will never be used.
> 

Yeah, I know but people shouldn't put functions which can fail inside
the declaration block.  And I also know that doing:

	struct cp2615_i2c_transfer_result *i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;

is fine even when "msg" is NULL.  But don't do that, because it is ugly.

> >         struct usb_device *usbdev = interface_to_usbdev(usbif);
> > -       int res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev, IOP_EP_IN),
> > -                              msg, sizeof(struct cp2615_iop_msg), NULL, 0);
> > +       struct cp2615_iop_msg *msg;
> > +       struct cp2615_i2c_transfer_result *i2c_r;
> > +       int res;
> > +
> > +       msg = kzalloc(sizeof(*msg), GFP_KERNEL);
> > +       if (!msg)
> > +               return -ENOMEM;
> 
> You will want to also make `cp2615_init_iop_msg()` return -ENOMEM
> instead of -EINVAL, for consistency's sake.
> 

I view that as unrelated and I'm sorry but this error handling code is
not really best practices...  I don't have time to fix it up.  :/

drivers/i2c/busses/i2c-cp2615.c
   124  static int
   125  cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
   126  {
   127          struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);

Don't put functions which can fail inside the declaration block.
Although, it is relatively uncommon to put allocations inside the
declaration block these sorts of allocations are over represented when
it comes to memory leaks and other static analysis bugs.

   128          struct usb_device *usbdev = interface_to_usbdev(usbif);
   129          int res = cp2615_init_i2c_msg(msg, i2c_w);

Handle failures immediately.  Try not to mix the error paths and the
success paths.  After a function call, then you're going to have to deal
with both failure and success path, but the failure path is just
"clean up and return an error code" and the success path is hopefully
going to continue for days or months.  So get the shorter failure path
out of the way first, then continue with the success path.

   130  
   131          if (!res)

Always do error handling, don't do success handling.

   132                  res = usb_bulk_msg(usbdev, usb_sndbulkpipe(usbdev, IOP_EP_OUT),
   133                                     msg, ntohs(msg->length), NULL, 0);

The success path should be indented one tab and the error handling
should be indented two tabs.

   134          kfree(msg);
   135          return res;
   136  }

The function should look like this.

static int
cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
{
	struct usb_device *usbdev = interface_to_usbdev(usbif);
	struct cp2615_iop_msg *msg;
	int res;

	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
	if (!msg)
		return -ENOMEM;

	res = cp2615_init_i2c_msg(msg, i2c_w);
	if (res)
		goto free;

	res = usb_bulk_msg(usbdev, usb_sndbulkpipe(usbdev, IOP_EP_OUT),
			   msg, ntohs(msg->length), NULL, 0);
free:
        kfree(msg);
        return res;
}

regards,
dan carpenter

