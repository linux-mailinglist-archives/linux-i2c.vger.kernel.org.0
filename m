Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C813DE1EA
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Aug 2021 23:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhHBVv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Aug 2021 17:51:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55622 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230313AbhHBVv2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Aug 2021 17:51:28 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 172LgsL8191400;
        Mon, 2 Aug 2021 17:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=d0lIuj8Lwlmbgne+0TNFcif0/a+Q8yd3dHFUrVLCszw=;
 b=H8G70haGBb+UC8LHShJ42voC+m4OmReGFbD9nHHsP/cnfAaDs9xxUnFZNwNcGTS5gmIR
 OgLWdp4tKI6z3Lwj8qnaJ6O1mu/ICQCG7yaYIDeT5jUg2nJWcANoDVmY1ExmUYbNnkjP
 n+xzzgVUpAZGlEl8HB5WSxh1NutcTIAGLSuAuIkwA37nOyznhGDIp0WUd+v/b3eaCshu
 dUnyHBir42xgFTNA3G4EI6bTqLEAM/sfSRsTC5cVX7XX+Ou/nccTbc6+EqYeSOuGbnvX
 xNXzEMeyWm5wgrH0M6IJlV6akzOtgddgI1VKbdGn55WNr4OC2GwdL2571RJFCp88cgoM wA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3a5rkxh7k6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Aug 2021 17:51:15 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172LhKVY006486;
        Mon, 2 Aug 2021 21:51:14 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma03dal.us.ibm.com with ESMTP id 3a4x5ch75n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Aug 2021 21:51:14 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 172LpCFv34668844
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Aug 2021 21:51:13 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E58EEC6055;
        Mon,  2 Aug 2021 21:51:12 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9CF84C6057;
        Mon,  2 Aug 2021 21:51:12 +0000 (GMT)
Received: from v0005c16 (unknown [9.163.11.215])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  2 Aug 2021 21:51:12 +0000 (GMT)
Message-ID: <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a
 single reset line
From:   Eddie James <eajames@linux.ibm.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, peda@axentia.se
Date:   Mon, 02 Aug 2021 16:51:11 -0500
In-Reply-To: <YQhZimPDbNJk5nbR@robh.at.kernel.org>
References: <20210727160315.15575-1-eajames@linux.ibm.com>
         <20210727160315.15575-3-eajames@linux.ibm.com>
         <YQhZimPDbNJk5nbR@robh.at.kernel.org>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4sUFPLLS8SpevACCNWW8TCJzfxq2bACG
X-Proofpoint-ORIG-GUID: 4sUFPLLS8SpevACCNWW8TCJzfxq2bACG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-02_07:2021-08-02,2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020137
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-08-02 at 14:46 -0600, Rob Herring wrote:
> On Tue, Jul 27, 2021 at 11:03:15AM -0500, Eddie James wrote:
> > Some systems connect several PCA954x devices to a single reset
> > GPIO. For
> > these devices to get out of reset and probe successfully, each
> > device must
> > defer the probe until the GPIO has been hogged. Accomplish this by
> > attempting to grab a new "reset-shared-hogged" devicetree property,
> > but
> > expect it to fail with EPROBE_DEFER or EBUSY.
> > 
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > ---
> >  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 +++++++++++++++++++++++
> > ------
> >  1 file changed, 37 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > index 4ad665757dd8..376b54ffb590 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > @@ -434,15 +434,43 @@ static int pca954x_probe(struct i2c_client
> > *client,
> >  	i2c_set_clientdata(client, muxc);
> >  	data->client = client;
> >  
> > -	/* Reset the mux if a reset GPIO is specified. */
> > -	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> > -	if (IS_ERR(gpio))
> > -		return PTR_ERR(gpio);
> > -	if (gpio) {
> > -		udelay(1);
> > -		gpiod_set_value_cansleep(gpio, 0);
> > -		/* Give the chip some time to recover. */
> > -		udelay(1);
> > +	/*
> > +	 * Grab the shared, hogged gpio that controls the mux reset. We
> > expect
> > +	 * this to fail with either EPROBE_DEFER or EBUSY. The only
> > purpose of
> > +	 * trying to get it is to make sure the gpio controller has
> > probed up
> > +	 * and hogged the line to take the mux out of reset, meaning
> > that the
> > +	 * mux is ready to be probed up. Don't try and set the line any
> > way; in
> > +	 * the event we actually successfully get the line (if it
> > wasn't
> > +	 * hogged) then we immediately release it, since there is no
> > way to
> > +	 * sync up the line between muxes.
> > +	 */
> > +	gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
> > +	if (IS_ERR(gpio)) {
> > +		ret = PTR_ERR(gpio);
> > +		if (ret != -EBUSY)
> > +			return ret;
> 
> Why can't you just do this with the existing 'reset-gpios' property? 
> What's the usecase where you'd want to fail probe because EBUSY
> other 
> than an error in your DT.

Hi, thanks for the reply.

Are you suggesting I use "reset-gpios" and change the driver to ignore
EBUSY? I don't know any other usecase, I just didn't think it would be
acceptable to ignore EBUSY on that, but perhaps it is a better
solution.

Thanks,
Eddie

> 
> > +	} else {
> > +		if (gpio) {
> > +			/* This is really a problem since now we don't
> > know the
> > +			 * state of the gpio. Log a warning and keep
> > trying to
> > +			 * probe the mux just in case it works.
> > +			 */
> > +			dev_warn(dev, "got hogged reset line, expect
> > error\n");
> > +			gpiod_put(gpio);
> > +		} else {
> > +			/* Reset the mux if a reset GPIO is specified.
> > */
> > +			gpio = devm_gpiod_get_optional(dev, "reset",
> > +						       GPIOD_OUT_HIGH);
> > +			if (IS_ERR(gpio))
> > +				return PTR_ERR(gpio);
> > +
> > +			if (gpio) {
> > +				udelay(1);
> > +				gpiod_set_value_cansleep(gpio, 0);
> > +				/* Give the chip some time to recover.
> > */
> > +				udelay(1);
> > +			}
> > +		}
> >  	}
> >  
> >  	data->chip = device_get_match_data(dev);
> > -- 
> > 2.27.0
> > 
> > 

