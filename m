Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DFFDD0B6
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 22:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404689AbfJRU4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 16:56:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38509 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388245AbfJRU4l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Oct 2019 16:56:41 -0400
Received: by mail-pl1-f196.google.com with SMTP id w8so3416099plq.5;
        Fri, 18 Oct 2019 13:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1Bh90+9APPDZOx6f6esXItoQjc1PkixlnP0eFA/mCVI=;
        b=W+dMBzk49oCPLVcN0Df1VUZxAhD15QLK/ZabCx9yBy1+FPb3JP84hKqdtYXVPSRrWt
         pdj3RUEtS3Gb4CtqXSJ8YEg37O5BrmWvR3BvcbiUIXWS0qnOqikoFddBjPKkjzps7y33
         YlT3chJfwVjXFs6aQnvGcT2oOLjhbxIm/BF3m5ZQCYUuF8Q+jIg0GLu0kAht7LkSykc+
         lP1MKdJiNbiqp15eC89qh1P7s5MVV86Vhq3agr+bkvt8nzhr21D6P8EHNbXS8lZKc/QF
         ZmgK9/ofNp1XU/E5HBaSS3kzxCwP0jEb32iMXKoFVQo7GccV5vLcyB8AfUoCZ91JJ2+N
         2tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1Bh90+9APPDZOx6f6esXItoQjc1PkixlnP0eFA/mCVI=;
        b=gI2NYwTr1CiHGzEeciTBlQjsPdASEbT8Ss9xOsYaHCOiFGLan3A3DoP4eus4xBVUvH
         1fBcFlGIWYIaZgERjBMFss9VpBwsjMCwNFB0VFwRABywEFC6Fo98tGiXZfFJdzSCnkwg
         N7GL+tWaZ7zBy/72VPw8fptmxypzvi3/YgpDgBXNRUSlLGBZ3ADdAsY6ogDeSO5yaIUx
         CHuJtHfx+7G93Z/QSwvTa9kf9PABVmgyRNxAwCPnhm9tlFRs0fog3BecTM+azShbHnyO
         ePs8LKVOkuySsfDfzQYc25aJz9wESBsRjEAQXJW6mi+lphN8MwybsQB6Cf1GlVAZq6Ki
         S1nw==
X-Gm-Message-State: APjAAAXGI6bzXxket1x9jYJJz5STrAMGr2Wawfj87nI+XUaDoHZBqwJB
        VNEv4WsRMNGkFuCWVPKNC54=
X-Google-Smtp-Source: APXvYqyZ16Yr+AO5Q5vWtUkZnIl11OBN3oIFY905K5S4POMVBw8yw+OOwSQTYvbT7scAoyBK9HLWXw==
X-Received: by 2002:a17:902:8b83:: with SMTP id ay3mr11787876plb.269.1571432199889;
        Fri, 18 Oct 2019 13:56:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s97sm9325439pjc.4.2019.10.18.13.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 13:56:39 -0700 (PDT)
Date:   Fri, 18 Oct 2019 13:56:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jakub Ladman <ladmanj@volny.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH][RESEND] New driver for TLV493D-A1B6 I2C chip, input and
 hwmon class device.
Message-ID: <20191018205637.GS35946@dtor-ws>
References: <966f09b8-0936-6d90-2ec8-bcb1b94c81aa@volny.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <966f09b8-0936-6d90-2ec8-bcb1b94c81aa@volny.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jakub,

On Fri, Oct 18, 2019 at 10:10:19PM +0200, Jakub Ladman wrote:
> Dear maintainers.
> 
> As a linux-patch newbie i made some mistakes in my first attempt to send
> this patch.
> This patch contains a new driver for i2c connected chip, Infineon
> TLV493D-A1B6.
> The chip is 3D hall-effect sensor with thermometer.
> 
> This particular driver senses magnetic field rotation in X/Y plane with 1
> degree resolution and +/- 1 degree error.
> 
> Input device is created for the angle sensing part.
> Hwmon device is created for the thermometer part.
> 
> Input device axis must be configured by device-tree. There are also optional
> parameters regarding absolute/relative mode switching, minimum step in
> relative mode, filtering and thermometer calibration.
> 
> We are using that device as high reliability rotary encoder.

I wonder if IIO subsystem that support s magnetometers and temperature
sensors would not be a better hone for this.

CC-ing Jonathan.

Also, your mailer mangled your patch pretty badly, please consider using
git send-email next time.

Thanks.

-- 
Dmitry
