Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B2FAA962
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 18:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390183AbfIEQxj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 12:53:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37699 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbfIEQxi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 12:53:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id y9so2139002pfl.4;
        Thu, 05 Sep 2019 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RWnMjjgITJJqdE2woZBvos5GFZ5W8pugG64G2X+tFzM=;
        b=lbxwZdSkgDsz8thBfK05SolVFonN7ns0WmIQsha4NqlZij7+w9cC8i3INFtRYbZRhj
         EZVmNIrGWtUqZAZYANLqTiVo+9NkqO74p/Yivm87vBHoTA4jjeUtfZAKOlhV2eqP2gfT
         0EK+OKsuGeXkWrIc37ztsq2d+ZH86hMUatvBzyyA6VAWfZ4R6/Om+LRll2wS7rvx+Wsr
         s37QR+aMWh9piE6l+t/qFRTNFU4jtzBGmKAibaA1GpomsO3mdfEf+euc7ZISjzN1RTtz
         VPUNDeWyYxal1zJvbmNq99KqDPDj9TkES+HCLFsjHKTdaHFlpBBlfGN6m3HzhetJq0Sq
         Rccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RWnMjjgITJJqdE2woZBvos5GFZ5W8pugG64G2X+tFzM=;
        b=BDm0vWGTwooWaRYwcrfoWSFqr4YVhJkjLFgEXhxwiWJC5VtautzBl1BubplV5jP7TH
         csA6B4ztdw8b7kOVvpDJ0x92zXD5KNvIPJm+jF+fC8+RjslNqxVDyW78+xaXNs/YjKsJ
         b85f0Yt1b1RXlWjZB2SlmjxtURk5HEMf5lAbPB6Dn9MCsTxiEiYXhPBvMY3e8LZDGVRB
         IReOP8B+U4RKCCKVn62H56FRmcBrGP/2IARZsKzN5frUGjeZYicQlnzFO+CsGe1IZnOz
         VaLI5PSz/8GjFbFBR4MrBUSmouYyCTr+s6YE8oAwlocHr83vSKWqgE/5O5rqqeuW468x
         II7Q==
X-Gm-Message-State: APjAAAXO8ZcMf/aBMZcBCAvkqFVTeyJGwQyCIVWx1IN4L+AxbRYdoEeg
        WqmimoTXKOBZ6KZZKTA+ncjjPE7U
X-Google-Smtp-Source: APXvYqxuur0SmCF/3LNMIqDzfUVkMPZT/G5qyihsk72t9YIOjXosGzQm/HCfA8STogqJAbz+dfBRAw==
X-Received: by 2002:a17:90a:a611:: with SMTP id c17mr5090767pjq.17.1567702418117;
        Thu, 05 Sep 2019 09:53:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s73sm2684946pjb.15.2019.09.05.09.53.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 09:53:36 -0700 (PDT)
Date:   Thu, 5 Sep 2019 09:53:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: muxes: pca9541: use BIT() macro
Message-ID: <20190905165335.GA23158@roeck-us.net>
References: <20190905131318.GA21280@SD.eic.com>
 <1d248333-abe9-cff8-ad29-d3b618643dc6@roeck-us.net>
 <20190905154448.GA3378@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905154448.GA3378@SD>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 05, 2019 at 09:15:36PM +0530, Saiyam Doshi wrote:
> On Thu, Sep 05, 2019 at 06:21:06AM -0700, Guenter Roeck wrote:
> > linux/bitops.h should be included when using BIT().
> 
> It's included from linux/i2c-mux.h and it compiled successfully.
> But if it's needed I'll update the patch and resend.
> 
> Just a question - What is the best practice in such case? Should the 
> header included explicitly?
> 

process/submit-checklist.rst says, as very first point:

1) If you use a facility then #include the file that defines/declares
   that facility.  Don't depend on other header files pulling in ones
   that you use.

Guenter
