Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B975254AB9C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 10:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238516AbiFNITG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 04:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235690AbiFNITG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 04:19:06 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA61E403D4
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 01:19:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 187F3CE19D5
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 08:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2176C3411B;
        Tue, 14 Jun 2022 08:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655194742;
        bh=P1zjT52/E2snNRLI5TqN1kIyBfwnsjDtkf8MAO8iets=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=D3HiHKIr2RpEt6IuzsohCjH0DbDaqKsAHABhUY0ubPYR/dvzQMDlhtJ434LiUhhwS
         rsXeyniqapWImaU2z643pwIkgObZlyhWrttghJIZDoKiIuy4sNtqj0Y1lxGL1hKk0z
         txwW/zpBc4Y8a4gDbU53u7pHC7cyDrNmhkVbdI7k=
Date:   Tue, 14 Jun 2022 10:18:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, git@xilinx.com
Subject: Re: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Message-ID: <YqhEc1XCyHUqOIMy@kroah.com>
References: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
 <YqdPtexPiukMlUcG@shikoro>
 <36da7a53-9bb4-26ae-0ac5-1ebcdf0ac695@xilinx.com>
 <YqhCvJdWw+g9ZZFL@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqhCvJdWw+g9ZZFL@shikoro>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 14, 2022 at 10:11:40AM +0200, Wolfram Sang wrote:
> 
> > Actually this was recommended by Greg in one of our thread here.
> > https://lore.kernel.org/all/20200318125003.GA2727094@kroah.com/
> 
> It is in the C standard, so any compiler not adhering to it has a bug.

Possibly, yes, but for enums that are part of the UAPI, we should
explicitly set them to be sure as we do not control what userspace
compilers are ever used.

Also when dealing with values that are reflected in hardware, it's good
to be explicit to help document the interface as well.

> It is especially not important here because we use the enums only
> locally and do not export.

Local stuff is fine, no need to set as there's no abi issues here.

thanks,

greg k-h
