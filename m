Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6950252675D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 May 2022 18:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382464AbiEMQpl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 12:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359461AbiEMQpi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 12:45:38 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19419B870;
        Fri, 13 May 2022 09:45:37 -0700 (PDT)
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4L0Dsj1Zgjz67LLT;
        Sat, 14 May 2022 00:40:41 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 18:45:34 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.24; Fri, 13 May
 2022 17:45:33 +0100
Date:   Fri, 13 May 2022 17:45:31 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Eddie James <eajames@linux.ibm.com>
CC:     <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <lars@metafoo.de>, <jic23@kernel.org>, <miltonm@us.ibm.com>,
        Peter Rosin <peda@axentia.se>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] iio: humidity: si7020: Check device property for
 skipping reset in probe
Message-ID: <20220513174531.00007b9b@Huawei.com>
In-Reply-To: <4fd44316-689e-1b72-d483-2c617d2a455d@linux.ibm.com>
References: <20220512162020.33450-1-eajames@linux.ibm.com>
        <20220512174859.000042b6@Huawei.com>
        <4fd44316-689e-1b72-d483-2c617d2a455d@linux.ibm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml708-chm.china.huawei.com (10.201.108.57) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 12 May 2022 12:08:07 -0500
Eddie James <eajames@linux.ibm.com> wrote:

> On 5/12/22 11:48, Jonathan Cameron wrote:
> > On Thu, 12 May 2022 11:20:18 -0500
> > Eddie James <eajames@linux.ibm.com> wrote:
> >  
> >> I2C commands issued after the SI7020 is starting up or after reset
> >> can potentially upset the startup sequence. Therefore, the host
> >> needs to wait for the startup sequence to finish before issuing
> >> further i2c commands. This is impractical in cases where the SI7020
> >> is on a shared bus or behind a mux, which may switch channels at
> >> any time (generating I2C traffic). Therefore, check for a device
> >> property that indicates that the driver should skip resetting the
> >> device when probing.  
> > Why not lock the bus?  It's not ideal, but then not resetting and hence
> > potentially ending up in an unknown state isn't great either.  
> 
> 
> Agreed, but locking the bus doesn't work in the case where the chip is 
> behind a mux. The mux core driver deselects the mux immediately after 
> the transfer to reset the si7020, causing some i2c traffic, breaking the 
> si7020. So it would also be a requirement to configure the mux to idle 
> as-is... That's why I went with the optional skipping of the reset. 
> Maybe I should add the bus lock too?
> 

+Cc Peter and linux-i2c for advice as we should resolve any potential
issue with the mux side of things rather than hiding it in the driver
(if possible!)

Jonathan




> 
> Thanks,
> 
> Eddie
> 
> 
> >
> > Jonathan
> >  
> >> Changes since v1:
> >>   - Fix dt binding document
> >>
> >> Eddie James (2):
> >>    dt-bindings: iio: humidity: Add si7020 bindings
> >>    iio: humidity: si7020: Check device property for skipping reset in probe
> >>
> >>   .../bindings/iio/humidity/silabs,si7020.yaml  | 47 +++++++++++++++++++
> >>   .../devicetree/bindings/trivial-devices.yaml  |  2 -
> >>   drivers/iio/humidity/si7020.c                 | 14 +++---
> >>   3 files changed, 55 insertions(+), 8 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/iio/humidity/silabs,si7020.yaml
> >>  

