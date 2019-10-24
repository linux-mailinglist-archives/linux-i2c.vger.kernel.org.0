Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6DDBE3ABB
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 20:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404921AbfJXSOj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 14:14:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41275 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404839AbfJXSOj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 14:14:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id l3so1249302pgr.8;
        Thu, 24 Oct 2019 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3o1fYiOdIiEj4DynNzDC32x1qEAi7S57H0c8INilQ88=;
        b=G+0/8N8qyVZhWupWMutng1rz2daYhHjuCxwpwgsI7LiTP/woH0ls5AIyEWuaJVSJbQ
         wMJgDkDOzNjqda5Rc+m4KKgBdnjmbe1T/ZvwClkjKvcdj6bkG/tPGeRK5ZMPq0Ryk88P
         QsZ/Z3wRTGWGYVmoyxWZTxnFzQ6lzOZQmrgQ5Gg4yyUsmIDVY+EyZXeEiGLtq7xc7wxi
         ojMcH4GF4VoGo3Abj/ipvA+ph5AWVyH/AhBKCab9/Pty4kSgRK56UdeQ7CPiNav7zwkt
         su/tSArX8Hqczd8nKjITgjSgPHJFhextbnaIUQJ0JAbV7xkoLqK/Wq/f9JNsgEYTIoL0
         UvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3o1fYiOdIiEj4DynNzDC32x1qEAi7S57H0c8INilQ88=;
        b=BxuLZQQxD0baEf8deKrJZPUfk/loYeLOEDhOyRCCuetB4qg4HYqJZfw4Wsw1DZBzDf
         bRTt6uSsjD6fduDP5tXRDtScnOawI/BbNAhMOH/rO9ZX4LSCFudEFlbrUMdQIgFotxzv
         oTDLFkHMiSUlkHygkQJH2RlDO6pSXNC3qYmA0suqYDTfr2KJwucW4bKaJVO8X+RtXyul
         t1ALs9GStSG3xjfPzA7V/aNxXVe93O4Jamq0LcrwwFIsyc4/R+J4IwWK3PwsFhfWGqEO
         mf9g0XG1r05iSf9mTrUzp3WMFeVXxgRBAt8bMz72fXBrMKKgfYER+91F/sHntIJxZhul
         73KQ==
X-Gm-Message-State: APjAAAUawQb082Rnp1sJrHqpo7EbAIIOK7A/X/g6B/F18LRgDDDZZied
        QY90FvUyizjyTnclTGQV+ZyPdp4r
X-Google-Smtp-Source: APXvYqz5YHKoUKY17EVt9DxGnRRu5c2Nc9tAAD0aFrpV68QDOv29HFwplmGrRlW6MXDrCX7rJE/BfA==
X-Received: by 2002:aa7:8e91:: with SMTP id a17mr5360720pfr.109.1571940878326;
        Thu, 24 Oct 2019 11:14:38 -0700 (PDT)
Received: from SD ([106.222.8.16])
        by smtp.gmail.com with ESMTPSA id q11sm9820746pgq.71.2019.10.24.11.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 11:14:37 -0700 (PDT)
Date:   Thu, 24 Oct 2019 23:44:24 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     linux@roeck-us.net, peda@axentia.se
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: muxes: pca9541: use BIT() macro
Message-ID: <20191024181354.GA6889@SD>
References: <20190905180423.GA7477@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905180423.GA7477@SD>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Any update / review comment on this?

-Saiyam
