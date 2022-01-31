Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEE54A4FA8
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 20:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348778AbiAaTp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 14:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240770AbiAaTp6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 14:45:58 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F88C061714;
        Mon, 31 Jan 2022 11:45:58 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id g15-20020a17090a67cf00b001b7d5b6bedaso145559pjm.4;
        Mon, 31 Jan 2022 11:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=006/8OHX6+u1AjFJpDJySc+x8beZciHLwH0JdA+GUO8=;
        b=SntdH3KcRPQuJaaaWW/tEIrTqX0yFOqperUWrHPQOV39kP/sJnfoYUrHuY9Y742lUy
         FDG4oakJInYuEmGnFUZcVgtz6ShkUMCX4Mis18QoVpScnASqCO+MHONdqh8u2CkQYZge
         O95oArvcKJ/8gGZKnTKrou3HNkpcGGwH/+4DH2vTZzwY/fQJLrXNuyI0plNINYArAODi
         C7I6DdDJX1i1PfxTZUa04ce+I7Y/3zMQSTsHdDC2i2e8y1oO3p23IfB5FeEOtwxefEcJ
         manz77JprbE3RQBrkvimBH4ULR0OnWaRwaTpMhyQFovSDGxQzPB+iXR6jQzxTucUqFLD
         4XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=006/8OHX6+u1AjFJpDJySc+x8beZciHLwH0JdA+GUO8=;
        b=PuSg8kpECE8kzUN87hz4dHMa9HHAKZFfYhDUvIL8QNxkJQICgJw3dYqHqALogd+5/g
         CzA2Su8UzoH6dltwhh1Ibd7sq5GDjI08F6VP2ld42F78EAFpy7x3FhBdFrX9AZmOW/Qy
         UQdYcq5SjzP/NmdiLe6X3ZmAeGG9M8vcAT51OF1ClpLplx+azGXCWu/w9DGRzsCoQDSD
         PpEQuFksV+8ggGpfy1p3b3nWuEIJu5gI/r9MLQhlu2W4BkuQ0ADiWw/4NZDvF7k98D2L
         G1piHU993/dZ6Bk8n1UMZQWh75rJtVm5QxZGZF7lhimQcdBXIgfhKLvl5WbO+BCfn0Cr
         JK2w==
X-Gm-Message-State: AOAM533G3Y172xI6wKWu6aVC6CQuRHimlBY3dTM+WMipIj5AIxTuPk5W
        cMhSbfWhzuNFHw6SQfIXYUk=
X-Google-Smtp-Source: ABdhPJxdho/GYn9CZr1JaFtmoVh/TWWDKrfEjn7oaS42OK1py2xdKQ/BKiZd9f9EgA9xgHL7ZffBTQ==
X-Received: by 2002:a17:90a:8c8b:: with SMTP id b11mr3732073pjo.197.1643658358046;
        Mon, 31 Jan 2022 11:45:58 -0800 (PST)
Received: from google.com ([2620:15c:202:201:6213:1c4:865f:204c])
        by smtp.gmail.com with ESMTPSA id j12sm19276170pgf.63.2022.01.31.11.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 11:45:56 -0800 (PST)
Date:   Mon, 31 Jan 2022 11:45:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Ondrej Jirman <x@xff.cz>
Subject: Re: [PATCH 3/5] Input: pinephone-keyboard - Build in the default
 keymap
Message-ID: <Yfg8crUuCLO0SxVj@google.com>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129230043.12422-4-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Samuel,

On Sat, Jan 29, 2022 at 05:00:40PM -0600, Samuel Holland wrote:
> The PinePhone keyboard comes with removable keys, but there is a default
> layout labeled from the factory. Use this keymap if none is provided in
> the devicetree.

Why can't we require to have it in device tree?

Thanks.

-- 
Dmitry
