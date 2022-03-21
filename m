Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97DC64E3395
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Mar 2022 23:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiCUWxv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Mar 2022 18:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiCUWxe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Mar 2022 18:53:34 -0400
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A693CD8C4;
        Mon, 21 Mar 2022 15:32:47 -0700 (PDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net [174.21.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 757FB113;
        Mon, 21 Mar 2022 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1647901967;
        bh=r4WfNG3naLSNSTH3OBiFqFDpGWTK1IXv86OvRgH10fE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=JZaLni9ntUONhphJ4aBgcdP+8Gzhh9K7hIuy/QQZiKY+0zXguJRz0ccqKZJyWqi7d
         /Z/OkLBd+MGcXdNPbW+A2F+P8TcfWnZDoXpdyOgBs9RDlu/koEDbcFhniCLTY6Qgcb
         sDXjCDg4XQAKNvV+xGrU7sUjElNDkaxX4fJE23CQ=
Date:   Mon, 21 Mar 2022 15:32:43 -0700
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yjj9C5PgBfgmXyp7@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
 <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
 <f3c56f5a-6a6b-039c-9fdf-a994d054645d@axentia.se>
 <YiAPKGSDJrO+MxLR@hatter.bewilderbeest.net>
 <YjRmUokDFPezGI5B@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YjRmUokDFPezGI5B@shikoro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 18, 2022 at 04:00:34AM PDT, Wolfram Sang wrote:
>
>Can someone give me a summary What is the status of this series?
>

I had been hoping Peter might offer any further thoughts on my last 
email regarding the feasibility/proper approach for implementing some 
sort of automated avoidance of the problem scenario he pointed out -- or 
alternately, if we think a written warning in the bindings is 
sufficient, I can send a v3 with that incorporated.


Thanks,
Zev

