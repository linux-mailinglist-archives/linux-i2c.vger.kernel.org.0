Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538733E03F0
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 17:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238794AbhHDPMg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 11:12:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22686 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237114AbhHDPMf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Aug 2021 11:12:35 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 174F5Quj023733;
        Wed, 4 Aug 2021 11:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=SbLA99YBkCDTvYoRyCg6c+QYBqoK+BM9HakRz7VEmRw=;
 b=Ye7xtzYcYzf//cmJqEejPyfe3duVuY25ZhaHKVxmEc5FJZYI0TY1fFSbdFfDQh1PxpZo
 92a9422Wb9TUO/URuR8jK/fTwbmha5/6I9fPw6RpCroneTIK59uWFtMDws0BQvl2X51b
 P+7HIs7aGl/V7tbGO8Pba6EFuw6iwdPRH2OneaCyg/bna8tL6BJQWgw6buMAizt1KAMo
 iZlkC76g/Lgl24HIMujllrmfprJaIB5P09FgtrO0tRvrkLllBpDtTGG0ewAfnpvy0qi/
 LljBUKuF2OqLZReRt/L+wb8TQ2Agdw56oXhtrTwLxLxZW3wMcJYIF8j60Rg6aGTsuzRg Sg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3a76r6bscc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Aug 2021 11:12:19 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 174F2ZMk027928;
        Wed, 4 Aug 2021 15:12:18 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma02wdc.us.ibm.com with ESMTP id 3a6nhw7xg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Aug 2021 15:12:18 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 174FCHsl47251822
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 4 Aug 2021 15:12:17 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7716C6A061;
        Wed,  4 Aug 2021 15:12:17 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2B54B6A057;
        Wed,  4 Aug 2021 15:12:17 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.39.200])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  4 Aug 2021 15:12:16 +0000 (GMT)
Message-ID: <8b4fc37178449e99c2f7a9d23429b7fb4bc13de4.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a
 single reset line
From:   Eddie James <eajames@linux.ibm.com>
To:     Rob Herring <robh@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Wed, 04 Aug 2021 10:12:16 -0500
In-Reply-To: <CAL_JsqLFC7vjMvZ3o6ey=thf=ZHsqApdT69e6akLvs0ceb8m1w@mail.gmail.com>
References: <20210727160315.15575-1-eajames@linux.ibm.com>
         <20210727160315.15575-3-eajames@linux.ibm.com>
         <YQhZimPDbNJk5nbR@robh.at.kernel.org>
         <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
         <209d9f68-e6c4-68c9-d495-d7e3f5050440@axentia.se>
         <CAL_JsqLFC7vjMvZ3o6ey=thf=ZHsqApdT69e6akLvs0ceb8m1w@mail.gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DrjR7rERvU23V8m3m24PuiNQmExExjoy
X-Proofpoint-ORIG-GUID: DrjR7rERvU23V8m3m24PuiNQmExExjoy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-04_03:2021-08-04,2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108040085
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2021-08-04 at 07:28 -0600, Rob Herring wrote:
> On Wed, Aug 4, 2021 at 1:50 AM Peter Rosin <peda@axentia.se> wrote:
> > On 2021-08-02 23:51, Eddie James wrote:
> > > On Mon, 2021-08-02 at 14:46 -0600, Rob Herring wrote:
> > > > On Tue, Jul 27, 2021 at 11:03:15AM -0500, Eddie James wrote:
> > > > > Some systems connect several PCA954x devices to a single
> > > > > reset
> > > > > GPIO. For
> > > > > these devices to get out of reset and probe successfully,
> > > > > each
> > > > > device must
> > > > > defer the probe until the GPIO has been hogged. Accomplish
> > > > > this by
> > > > > attempting to grab a new "reset-shared-hogged" devicetree
> > > > > property,
> > > > > but
> > > > > expect it to fail with EPROBE_DEFER or EBUSY.
> > > > > 
> > > > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > > > ---
> > > > >  drivers/i2c/muxes/i2c-mux-pca954x.c | 46
> > > > > +++++++++++++++++++++++
> > > > > ------
> > > > >  1 file changed, 37 insertions(+), 9 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > index 4ad665757dd8..376b54ffb590 100644
> > > > > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > @@ -434,15 +434,43 @@ static int pca954x_probe(struct
> > > > > i2c_client
> > > > > *client,
> > > > >     i2c_set_clientdata(client, muxc);
> > > > >     data->client = client;
> > > > > 
> > > > > -   /* Reset the mux if a reset GPIO is specified. */
> > > > > -   gpio = devm_gpiod_get_optional(dev, "reset",
> > > > > GPIOD_OUT_HIGH);
> > > > > -   if (IS_ERR(gpio))
> > > > > -           return PTR_ERR(gpio);
> > > > > -   if (gpio) {
> > > > > -           udelay(1);
> > > > > -           gpiod_set_value_cansleep(gpio, 0);
> > > > > -           /* Give the chip some time to recover. */
> > > > > -           udelay(1);
> > > > > +   /*
> > > > > +    * Grab the shared, hogged gpio that controls the mux
> > > > > reset. We
> > > > > expect
> > > > > +    * this to fail with either EPROBE_DEFER or EBUSY. The
> > > > > only
> > > > > purpose of
> > > > > +    * trying to get it is to make sure the gpio controller
> > > > > has
> > > > > probed up
> > > > > +    * and hogged the line to take the mux out of reset,
> > > > > meaning
> > > > > that the
> > > > > +    * mux is ready to be probed up. Don't try and set the
> > > > > line any
> > > > > way; in
> > > > > +    * the event we actually successfully get the line (if it
> > > > > wasn't
> > > > > +    * hogged) then we immediately release it, since there is
> > > > > no
> > > > > way to
> > > > > +    * sync up the line between muxes.
> > > > > +    */
> > > > > +   gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
> > > > > +   if (IS_ERR(gpio)) {
> > > > > +           ret = PTR_ERR(gpio);
> > > > > +           if (ret != -EBUSY)
> > > > > +                   return ret;
> > > > 
> > > > Why can't you just do this with the existing 'reset-gpios'
> > > > property?
> > > > What's the usecase where you'd want to fail probe because EBUSY
> > > > other
> > > > than an error in your DT.
> > > 
> > > Hi, thanks for the reply.
> > > 
> > > Are you suggesting I use "reset-gpios" and change the driver to
> > > ignore
> > > EBUSY? I don't know any other usecase, I just didn't think it
> > > would be
> > > acceptable to ignore EBUSY on that, but perhaps it is a better
> > > solution.
> > 
> > Hi!
> > 
> > From a device-tree point of view that might seem simple. But it
> > becomes
> > a mess when several driver instances need to coordinate. If one
> > instance
> > is grabbing the reset line but is then stalled while other
> > instances
> > race ahead, they might be clobbered by a late reset from the
> > stalled
> > first instance.

Hi,

Well this isn't a concern if the line is hogged - once it's hogged it
shouldn't change, and all driver instances should get the same thing -
EBUSY. Before it's hogged all driver instances should get EPROBE_DEFER.

> > 
> > And while it might be possible to arrange the code such that those
> > dragons
> > are dodged and that the reset is properly coordinated, what if the
> > gpio is
> > supposed to be shared with some other totally unrelated driver? It
> > might
> > seem to work when everything is normal, but as soon as anything out
> > of the
> > ordinary happens, all bets are off. I expect subtle problems in the
> > furture.

Unless another driver uses the non-exclusive flag (which can cause many
subtle problems in all sorts of areas anyway), the GPIO shouldn't
change. Now, the driver that does the GPIO hogging might go away, which
definitely would be a problem. I suppose I feel it's an error path
anyway, so all bets are off for dependent devices.

> 
> All of this is true, but a different reset GPIO property name does
> nothing to solve it.

This is part of why I chose a new property that specifically indicates
that it's hogged.

> 
> > I see no simple solution to this, and I also expect that if gpios
> > need
> > to be shared, there will eventually need to be some kind of layer
> > that
> > helps with coordination such that it becomes explicit rather than
> > implicit and fragile.
> 
> Yes, like making the reset subsystem handle 'reset-gpios' properties
> as I suggested.

That would be nice... if anyone has the time for such an extensive
addition :(

Thanks,
Eddie

> 
> Rob

